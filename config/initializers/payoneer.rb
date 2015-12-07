Payoneer.configure do |c|
  c.environment = Rails.env
  c.partner_id = Rails.application.secrets.partner_id
  c.partner_username = Rails.application.secrets.partner_username
  c.partner_api_password = Rails.application.secrets.partner_api_password

  if Rails.env.development? || Rails.env.test?
    c.auto_approve_sandbox_accounts = true
  end
end
