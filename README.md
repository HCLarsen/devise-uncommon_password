# Devise Uncommon Password

[![Build Status](https://travis-ci.org/HCLarsen/devise-uncommon_password.svg?branch=master)](https://travis-ci.org/HCLarsen/devise-uncommon_password)
[![Code Climate](https://codeclimate.com/github/HCLarsen/devise-uncommon_password.svg)](https://codeclimate.com/github/HCLarsen/devise-uncommon_password)

Devise::UncommonPassword is an extension for the [devise](https://github.com/heartcombo/devise) gem, which prevents users from signing up using one of the 100 most common passwords. The list is derived from the darkweb2017_top10K.txt found at: https://github.com/danielmiessler/SecLists/tree/master/Passwords.

## Usage

Add the `:uncommon_password` module to your model:

```ruby
class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :uncommon_password
end
```

By default, the password is checked against the 100 most common passwords that fit within the minimum and maximum lengths specified in the /config/initializers/devise.rb file. However, if a developer wants to check against a larger list, they may override this default by adding the following line to that same file:

```ruby
# Number of common passwords to check entered password against.
config.password_matches = 1000
```

### Internationalization and Customization

The default message for users who attempt to use a common password is:

```
is a very common password. Please choose something harder to guess.
```

This can be changed by modifying the `devise.en.yml` file, under errors/messages/common_password. Translations can be provided using the devise translation files in the same location.

```yml
en:
  errors:
    messages:
      common_password: 'is a very common password. Please choose something harder to guess.'
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'devise-uncommon_password'
```

And then execute:
```bash
$ bundle install
```

## Contributing

You can contribute by doing the following:

* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork it
* Write your changes
* Test
* Commit
* Send a pull request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
