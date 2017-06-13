# Devise::UncommonPassword
devise-uncommon_password is an extension for the devise gem, which prevents users from signing up using one of the 100 most common passwords. Currently, the list of common passwords is derived from the list at  http://www.whatsmypass.com/the-top-500-worst-passwords-of-all-time. As devise already rejects passwords less than 8 characters in length, I removed all such passwords from the list, and then selected the top 100 from the remaining passwords.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'devise-uncommon_password'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install devise-uncommon_password
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
