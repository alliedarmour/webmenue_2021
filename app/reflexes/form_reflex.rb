# frozen_string_literal: true

class FormReflex < ApplicationReflex
  def login
    element.checked ? @ldap = true : @ldap = false
  end
end
