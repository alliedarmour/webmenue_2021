# frozen_string_literal: true

class MealCardComponent < ViewComponent::Base
  def initialize(tip:, description:, day:)
    @tip = tip
    @description = description
    @day = day
  end

end
