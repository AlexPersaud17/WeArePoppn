class PartiesController < ApplicationController

  def show
    @party = Party.find_by(id: params[:id])
    if @party && logged_in? && @party.attendees.include?(current_user)
      @location = @party.location.gsub(' ', '%20')
      if @party.drinks.length > 0
        @suggested_cocktails = @party.absolutAPI
      end
    else
      render "./404"
    end
    if request.xhr?
      render partial: "cocktail_recipes", locals: {suggested_cocktails: @suggested_cocktails}
    else
      render "show"
    end
  end

  def new
    @party = Party.new
  end

  def create
    @party = current_user.hosted_parties.new(party_params)
    if @party.save
      @party.guests.create(party: @party, user: current_user)
      redirect_to @party
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
        redirect_to @party
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
