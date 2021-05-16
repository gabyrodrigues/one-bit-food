class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show

  def index
    @restaurants = Restaurant.all
    filter_by_query if params[:query]
    filter_by_city if params[:city]
    filter_by_category if params[:category]
  end

  def show
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def filter_by_query
    @restaurants = @restaurants.ransack(name_or_description_cont: params[:query]).result #busca restaurante por nome ou descrição
  end

  def filter_by_city
    @restaurants = @restaurants.where(city: params[:city])
  end

  def filter_by_category
    @restaurants = @restaurants.select do |restaurant| ##seleciona apenas os restaurantes com a categoria do parametro
      restaurant.category.title == params[:category]
    end
  end
end
