class PartiesController < ApplicationController

  before_action :find_party_by_id, except: [:new, :create]

  def show
    if theres_a_party_and_youre_invited?
      @location = @party.location.gsub(' ', '%20')
      if @party.drinks.length > 0
        @suggested_cocktails = @party.absolutAPI
        @sampled_drink = @party.sampled_drink
      end
      if request.xhr?
        render partial: "cocktail_recipes", locals: {suggested_cocktails: @suggested_cocktails, sampled_drink: @sampled_drink}
      else
        render "show"
      end
    else
      render "./404"
    end
  end

  def new
    @party = Party.new
  end

  def edit
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

  def update
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

  def destroy
    @party.destroy
    redirect_to "/users/#{current_user.id}"
  end

  private
  def party_params
    params.require(:party).permit(:name, :description, :location, :date)
  end

  def find_party_by_id
    @party = Party.find_by(id: params[:id])
  end

  def theres_a_party_and_youre_invited?
    @party && logged_in? && @party.attendees.include?(current_user)
  end
end
