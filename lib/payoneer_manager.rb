module PayoneerManager
  def self.usd
    set_config('usd')
  end

  def self.eur
    set_config('eur')
  end

  def self.gbp
    set_config('gbp')
  end

  def self.set_config(currency)
    Payoneer.configure do |c|
      c.environment = Rails.env
      c.partner_id = Rails.application.secrets.payoneer[currency]['partner_id']
      c.partner_username =
        Rails.application.secrets.payoneer[currency]['partner_username']
      c.partner_api_password =
        Rails.application.secrets.payoneer[currency]['partner_api_password']

      if Rails.env.development? || Rails.env.test?
        c.auto_approve_sandbox_accounts = true
      end
    end

    Payoneer
  end
end

