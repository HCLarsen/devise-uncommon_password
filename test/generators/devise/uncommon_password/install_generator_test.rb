# frozen_string_literal: true

require 'test_helper'

require './lib/generators/devise/uncommon_password/install_generator'

module Devise
  module UncommonPassword
    module Generators
      class InstallGeneratorTest < Rails::Generators::TestCase
        tests Devise::UncommonPassword::Generators::InstallGenerator
        destination File.expand_path('../../tmp', __FILE__)
        setup :prepare_destination

        test 'assert all files are properly created' do
          run_generator
          assert_file('config/locales/devise-uncommon-password.en.yml')
        end
      end
    end
  end
end
