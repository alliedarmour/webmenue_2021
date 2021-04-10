require "faker"

# Creating Users and their according Identities
5.times do |count|
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
    puts "--- Created user #{user.full_name} with username #{user.username} ---"
end