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
          file.each { |password| passwords << password.chomp.downcase }
        end
        passwords.select! {|password| Devise.password_length.include? password.length }
        passwords[0..Devise.password_matches-1]
      end

      included do
        validate :not_common_password, if: :password_required?
      end

      module ClassMethods
        Devise::Models.config(self, :password_matches)
      end

      private

      def not_common_password
        if Devise::Models::UncommonPassword.common_passwords.include? password&.downcase
          errors.add(:password, :common_password)
        end
      end
    end
  end
end
