# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserDecorator do
  context "instance methods" do 
    let(:user) { User.create(first_name: "Test", last_name: "User") }
    subject { decorate user }

    it "should concetance first_name and last_name to the full name" do 
      expect(subject.full_name).to eq("Test User")
    end
  end
end
