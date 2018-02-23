require 'test_helper'

class Devise::UncommonPassword::Test < ActiveSupport::TestCase
  test "should return the specified number of passwords" do
    Devise.password_matches = 1000
    assert_equal Devise.password_matches, Devise::Models::UncommonPassword.common_passwords.size
    Devise.password_matches = 100
  end

  test "should return smaller array when pass_matches is too long" do
    Devise.password_matches = 10000
    assert Devise::Models::UncommonPassword.common_passwords.size <= Devise.password_matches
    Devise.password_matches = 100
  end

  test "should only return passwords of suitable length" do
    passwords = Devise::Models::UncommonPassword.common_passwords
    passwords.each do |password|
      assert Devise.password_length.include? password.length
    end
  end

  test "should deny validation for a common password" do
    passwords = Devise::Models::UncommonPassword.common_passwords
    passwords.each do |password|
      user = User.create email:"example@example.org", password: password, password_confirmation: password
      assert_not user.valid?, "User with common password of #{password} should not be valid."
    end
  end

  test "should deny case variations of common passwords" do
    passwords = Devise::Models::UncommonPassword.common_passwords
    password = passwords.first.upcase
    user = User.create email:"example@example.org", password: password, password_confirmation: password
    assert_not user.valid?, "Uppercase common passwords should not be valid."
    assert_equal ["is a very common password. Please choose something harder to guess."], user.errors[:password]
  end

  test "should accept validation for an uncommon password" do
    password = "fddkasnsdddghjt"
    user = User.create email:"example@example.org", password: password, password_confirmation: password
    assert user.valid?, "User with uncommon password should be valid."
  end

  test "should not attempt to validate if model changed without updating password" do
    password = "fddkasnsdddghjt"
    user = User.create email:"example@example.org", password: password, password_confirmation: password

    assert user.update_attributes(email: 'anotherexample@example.org')
  end
end
