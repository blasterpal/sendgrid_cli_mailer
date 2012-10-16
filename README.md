# SendgridCliMailer

This is a simple gem I wrote so I could email from Utility servers or
servers without Rails from CLI. I chose Ruby so I wouldn't have to
depend on any SMTP deamons,etc.

Thanks @freerobby at https://github.com/freerobby/sendgrid_toolkit for
the Ruby API.

## Installation

Add this line to your application's Gemfile:

    gem 'sendgrid_cli_mailer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sendgrid_cli_mailer

## Usage

### Using command line arguments

You can send a message with a body specified via arguments:

    sg_mail mail --from 'admin@yourjoint.com' --to 'hank@me.com' --subject 'Testing CLI' --body 'Short Body' --user 'sg@foo.com' --key '1234'" 

OR use your body input in other ways like so:

    sg_mail mail --from 'admin@yourjoint.com' --to 'hank@me.com' --subject 'Testing CLI' --user 'sg@foo.com' --key '1234'" --body `cat /etc/hosts`

### Using less command line arguments

You can save a file called .sg_mail in your home directory and this file
can make using a little easier.

~/.sg_mail example:

    user: foo@bar.com
    key: 12351
    from: server1@staging.yourdomain.com

Then the command line is a little more terse and similar to unix mail:

    sg_mail mail -f devops@yourco.com -t hank@mydomain.com -s "Database Backup complete!" -b "`cat /var/log/db.log`"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
