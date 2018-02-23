require 'devise'
require 'devise/uncommon_password/model'

module Devise
  mattr_accessor :password_matches
  @@password_matches = 100
  module UncommonPassword
  end
end

Devise.add_module :uncommon_password, model: "devise_uncommon_password/model"
