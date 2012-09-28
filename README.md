catch-all-delivery-method
=========================

Catch-all delivery method with optional recipients whitelist.

# Installation

Install the gem

```ruby
git clone git://github.com/rogal111/catch-all-delivery-method.git
cd catch-all-delivery-method
gem build catch-all-delivery-method.gemspec
gem install catch-all-delivery-method-0.0.0.gem
```

or add it to your Gemfile

```ruby
gem 'catch-all-delivery-method', '>=0.0.0', :git => 'git://github.com/rogal111/catch-all-delivery-method.git'
```

# Setup

In __config/environments/development.rb__ (or another environment) setup delivery_method:

```ruby
config.action_mailer.delivery_method = :catch_all
config.action_mailer.catch_all_settings = {
    :recipient_email => 'main_tester@example.com', # required
    :whitelist => ['tester1@example.com','tester2@example.com'], # this line is optional
    
    ##put your standard SMTP settings here
      }
```

or in your mailer settings:

```ruby
class MyMailer < ActionMailer::Base
  self.delivery_method = :catch_all
  self.catch_all_settings = Rails.configuration.action_mailer.smtp_settings.merge({
      :recipient_email => 'main_tester@example.com', # required
	  :whitelist => ['tester1@example.com','tester2@example.com'], # this line is optional
     })
   
   ####
   # rest of mailer code
   ####
end
   
```