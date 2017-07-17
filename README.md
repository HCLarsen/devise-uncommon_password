# Devise Uncommon Password

[![Code Climate](https://codeclimate.com/github/HCLarsen/devise-uncommon_password.svg)](https://codeclimate.com/github/HCLarsen/devise-uncommon_password)

Devise::UncommonPassword is an extension for the devise gem, which prevents users from signing up using one of the 100 most common passwords. Currently, the list of common passwords is derived from the list at http://www.passwordrandom.com/most-popular-passwords. As devise already rejects passwords less than 8 characters in length, I removed all such passwords from the list, and then selected the top 100 from the remaining passwords.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'devise-uncommon_password'
```

And then execute:
```bash
$ bundle install
```

Then add the ':uncommon_password' module to your model:
```
class User < ActiveRecord::Base
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :uncommon_password
end
```

And you're ready to go.

## Contributing

You can contribute by doing the following:

* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork it
* Write your changes
* Commit
* Send a pull request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
