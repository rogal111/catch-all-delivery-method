# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "catch-all-delivery-method"
  s.version     = "0.0.0"
  s.authors     = ["Michał Rogowski"]
  s.email       = ["michal.rogowski1@gmail.com"]
  s.homepage    = "https://github.com/rogal111/catch-all-delivery-method"
  s.summary     = "Catch-all delivery method with optional recipients whitelist"
  s.description = <<-EOD
   This action mailer delivery method is for testing purposes. For example when you want to test mail delivery on production data.
EOD

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  # Run-time dependencies
  s.add_dependency 'mail'
  s.add_dependency 'actionmailer'
end
