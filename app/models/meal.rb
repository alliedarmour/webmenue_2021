class Meal < ApplicationRecord
    enum tip: {
        full_diet: "Vollkost",
        light_food: "Schonkost",
        vegetarian: "Vegetarisch",
        salad: "Salad"
    }
end
