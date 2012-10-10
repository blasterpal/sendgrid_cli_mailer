# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sendgrid_cli_mailer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Hank Beaver"]
  gem.email         = ["hank.beaver@blinqmedia.com"]
  gem.description   = %q{Simple CLI mailer for Sendgrid via API}
  gem.summary       = %q{Provides a sg_mailer CLI to send mail to your Sendgrid account}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sendgrid_cli_mailer"
  gem.require_paths = ["lib"]
  gem.version       = SendgridCliMailer::VERSION
  gem.add_dependency "sendgrid_toolkit", "~>1.2"
  gem.add_dependency "commander", "~> 4.1"

end
