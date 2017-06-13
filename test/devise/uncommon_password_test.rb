require 'test_helper'

class Devise::UncommonPassword::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Devise::UncommonPassword
  end
end
