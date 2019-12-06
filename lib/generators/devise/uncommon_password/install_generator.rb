# frozen_string_literal: true

require 'rails/generators/base'

module Devise
  module UncommonPassword
    module Generators
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path('../../../templates', __FILE__)

        desc 'Copy locale files to your application.'

        def copy_locale
          copy_file '../../../config/locales/en.yml', 'config/locales/devise-uncommon-password.en.yml'
        end
      end
    end
  end
end
