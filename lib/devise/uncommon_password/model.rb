module Devise
  module Models
    module UncommonPassword
      extend ActiveSupport::Concern

      def self.common_passwords
        passwords_file = File.expand_path("./lib/devise/uncommon_password/passwords.txt")
        passwords = []
        File.open(passwords_file, "r") do |file|
          file.each do |password|
            passwords << password.chomp
          end
        end
        passwords
      end

      included do
        validate :not_common_password
      end

      private

      def not_common_password
        if Devise::Models::UncommonPassword.common_passwords.include? password
        #if password == "password"
          errors.add(:password, "is one of the 100 most common passwords. Please choose something harder to guess.")
        end
      end
    end
  end
end
