module Devise
  module Models
    # The UncommonPassword module adds a new validation for Devise Models.
    # No modifications to routes or controllers needed.
    # Simply add :uncommon_password to the list of included modules in your
    # devise module, and all new registrations will be blocked if they use
    # a common password.
    module UncommonPassword
      extend ActiveSupport::Concern
      # Returns a list of the 100 most common passwords.
      def self.common_passwords
        passwords_file = File.join(File.dirname(__FILE__), "passwords.txt")

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
        if Devise::Models::UncommonPassword.common_passwords.include? password.downcase
          errors.add(:password, "is a very common passwords. Please choose something harder to guess.")
        end
      end
    end
  end
end
