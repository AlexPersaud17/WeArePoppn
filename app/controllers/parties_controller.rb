class PartiesController < ApplicationController

  def show
    @party = Party.find_by(id: params[:id])
    if @party && logged_in? && @party.attendees.include?(current_user)
      @location = @party.location.gsub(' ', '%20')
      if @party.drinks.length > 0
        query = @party.drinks.sample.name.gsub(' ', '%20')
        uri = URI.parse("http://addb.absolutdrinks.com/quickSearch/drinks/#{query}/?apiKey=#{ENV["DRINK_API_KEY"]}")
        response = Net::HTTP.get_response(uri)
        body = JSON.parse(response.body)
        @suggested_cocktails = body["result"].sample(3)
      end
    else
      render "./404"
    end
  end

  def new
    @party = Party.new
  end

  def create
    @party = current_user.hosted_parties.new(party_params)
    if @party.save
      @party.guests.create(party: @party, user: current_user)
      redirect_to new_party_item_path(@party)
    else
      @errors = @party.errors.full_messages
      render :new
    end
  end

  def destroy
    @party = Party.find_by(id: params[:id])
    @party.destroy
    redirect_to "/users/#{current_user.id}"
  end

  def edit
    @party = Party.find_by(id: params[:id])
  end

  def update
    @party = Party.find_by(id: params[:id])
    @party.assign_attributes(party_params)
    if @party.save
      if request.xhr?
        render :partial => "details", locals: {party: @party}
      else
        redirect_to "/parties/#{@party.id}"
      end
    else
      @errors = @party.errors.full_messages
      if request.xhr?
        render :partial => "./errors"
      else
       render :edit
      end
    end
  end

  private
  def party_params
    params.require(:party).permit(:name, :description, :location, :date)
  end
end
