require 'devise'
require 'devise/uncommon_password/model'

module Devise
  module UncommonPassword
  end
end

Devise.add_module :uncommon_password, model: "devise_uncommon_password/model"
