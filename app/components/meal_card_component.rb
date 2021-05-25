# frozen_string_literal: true

class MealCardComponent < ViewComponent::Base
  extend Forwardable
  renders_one :index

  attr_reader :meal

  def_delegators :@meal, :default_meal_order, :description, :tip, :day

  def initialize(meal:)
    @meal = meal
  end

  def tile_color(meal)
    case meal.tip 
    when "full_diet"
      "danger"
    when "light_food"
      "warning"
    when "vegetarian"
      "success"
    end
  end
end
