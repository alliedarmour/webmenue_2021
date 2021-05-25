class Meal < ApplicationRecord
    DEFAULT_ORDER = ["full_diet", "light_diet", "vegetarian"]

    enum tip: {
        full_diet: "Vollkost",
        light_food: "Schonkost",
        vegetarian: "Vegetarisch",
        salad: "Salad"
    }, _prefix: :type

    scope :order_by_meal_type, -> { order(default_meal_order) }

    class << self
        def except_salad
            where.not(tip: [:salad])
        end

        def default_meal_order
            order_query = "CASE"
            DEFAULT_ORDER.each_with_index do |tip, idx|
                order_query << sanitize_sql_array([" WHEN tip = ? THEN #{idx}", tip])
            end
            Arel.sql(order_query << " END")
        end
    end
end
