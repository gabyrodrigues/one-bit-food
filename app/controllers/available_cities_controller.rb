class AvailableCitiesController < ApplicationController
  def index
    @available_cities = Restaurant.all.map { |restaurant| restaurant.city }.uniq
  end
end
