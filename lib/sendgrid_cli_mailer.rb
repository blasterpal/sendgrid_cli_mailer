require "sendgrid_cli_mailer/version"
require 'rubygems'
require 'commander/import'
require 'sendgrid_toolkit'

module SendgridCliMailer
  class Runner
    def initialize(args,stdin)
      program :version, '0.1'
      program :description, 'Sendgrid Ruby Mailer CLI'
      default_command :mail

      command :mail do |c|
        c.syntax = "sg_mailer --from 'admin@yourjoint.com' --to 'hank@blinqmedia.com' --subject 'TEsting CLI' --body 'Short Body' --user 'sg@foo.com' --key '1234'"
        c.summary = 'Use standard input for message body'
        c.description = ''
        c.example 'description', 'command example'
        c.option '--from foo@exaple.com',String, 'from email'
        c.option '--to foo2@example.com',String,  'to email'
        c.option '--subject "Nice Subject"',String,  'email subject'
        c.option '--body "Short Body"',String,  'email body'
        c.option '--user nimda@co.com',String,  'sendgrid user'
        c.option '--key 123123', String, 'sendgrid api key (same as web password)'
        c.action do |args, options|
          # Do something or c.when_called Sg_mailer::Commands::Mail
          stdin_body = stdin.read if stdin.stat.size > 0
          body  = stdin_body || options.body || "No Message Body"
          unless ( (%(user key to from subject) && options.__hash__.keys).size == 5)
            SendgridToolkit::Mail.new(options.user, options.key).send_mail :to => options.to, :from => options.from, 
              :subject => options.subject, :text => body
          else
            puts "Command options incorrect! Try this:"
            puts c.syntax
          end  
        end
      end

    end
  end
end
