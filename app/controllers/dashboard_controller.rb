class DashboardController < ApplicationController
  def index
    @meals = Meal.where(day: Date.today).except_salad.order_by_meal_type
  end
end
