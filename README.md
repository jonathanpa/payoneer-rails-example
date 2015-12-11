# payoneer-rails-example
A rails example app for Payoneer API calls using the gem [payoneer-ruby](https://github.com/jonathanpa/payoneer-ruby).

## Setup
### Edit your .env
```
$ cp .env.sample .env
```
Then edit `.env` and fill your Payoneer credentials according to your currency (USD, EUR, GBP). Set `PAYONEER_REDIRECT_HOST`
and `PAYONEER_REDIRECT_PORT` to the host and port of your server for the sign-up confirmation request sent by Payoneer.

### Create the currencies and database
`rake db:setup` to create the database, run the migrations and create 3 `Currency`: USD, EUR, GBP.

## Use
### Sign up
1. Create a new `Payee` with an email as Payoneer payee identifier.
2. Choose one currency among USD, EUR, GBP according to your Payoneer account(s).
3. Click on the *Payoneer sign up* link to sign up on Payoneer.
4. Fill the sign-up forms required by Payoneer.
5. If sign up is successful, you are *normally* redirected to the `Payee` show page.

### Payout
1. Once a payee created from the Rails example application has been validated by Payoneer (check the *Payee list* in
the sandbox admin panel provided by Payoneer).
2. On a `Payee` show page, click the link *Make Payout* to make a payout with the currency of the `Payee`
just created.


