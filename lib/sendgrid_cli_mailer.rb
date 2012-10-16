require "sendgrid_cli_mailer/version"
module SendgridCliMailer
  #other code can go here  
  class Runner
    def initialize(mailer_settings,options,body)
      SendgridToolkit::Mail.new(mailer_settings['user'], mailer_settings['key']).send_mail :to => options[:to], :from => mailer_settings['from'], 
        :subject => options[:subject], :text => body
    end
  end
end
