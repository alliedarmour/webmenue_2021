require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  it "should display 'Login' and the login form with text fields" do 
    render # render the actual template

    expect(rendered).to have_selector("h1", text: "Login")
    expect(rendered).to have_text("Login")
    expect(rendered).to have_field("auth_key")
    expect(rendered).to have_field("password")
    expect(rendered).to have_button("Login")
  end
end
