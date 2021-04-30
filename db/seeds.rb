require "faker"

Creating Users and their according Identities
50.times do |count|
    user = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
    )
    user.build_identity( 
        username: Faker::Internet.unique.username,
        password: "foobar",
        password_confirmation: "foobar",
        provider: "identity"
    )
    user.save
end

# Creating Meals with description
80.times do |idx|
    Meal.tips.each do |key, value| 
        Meal.create!(tip: key, description: Faker::Food.description, day: Date.today + idx)
    end
end