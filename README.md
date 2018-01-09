# Devise Uncommon Password

[![Build Status](https://travis-ci.org/HCLarsen/devise-uncommon_password.svg?branch=master)](https://travis-ci.org/HCLarsen/devise-uncommon_password)
[![Code Climate](https://codeclimate.com/github/HCLarsen/devise-uncommon_password.svg)](https://codeclimate.com/github/HCLarsen/devise-uncommon_password)

Devise::UncommonPassword is an extension for the devise gem, which prevents users from signing up using one of the 100 most common passwords. The list is derived from the darkweb2017_top10K.txt found at: https://github.com/danielmiessler/SecLists/tree/master/Passwords. Since the Devise gem allows developers to set the minimum and maximum lengths for passwords, this gem uses that information to provide only the top 100 passwords that fit into that length.

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
