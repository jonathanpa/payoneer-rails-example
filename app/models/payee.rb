class Payee < ActiveRecord::Base
  belongs_to :currency

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 20.0 }
  validates :currency, presence: true

  after_create :sign_up

  def payout
    payment_id = SecureRandom.hex(8)
    response = PayoneerManager.usd::Payout.create(
      program_id: Rails.application.secrets.payoneer['usd']['program_id'],
      payment_id: payment_id,
      payee_id: self.email,
      amount: self.balance,
      description: "Test payout to #{self.email} with amount #{self.balance}",
      payment_date: Time.now,
      currency: self.currency.code
    )
    Rails.logger.debug "PAYONEER : Payout #{payment_id} => Code : #{response.code},\
      Description: #{response.body}"
    response
  end

  private

  def sign_up
    self.return_tag = SecureRandom.hex(8)
    response = PayoneerManager.usd::Payee.signup_url(self.email,
                                                     redirect_url: redirect_url)
    self.sign_up_url = response.body if response.ok?
    save!
  end

  def redirect_url
    uri = URI::HTTP.build(host: Rails.application.secrets.payoneer['redirect_host'],
                         port: Rails.application.secrets.payoneer['redirect_port'],
                         path: "/payees/#{self.id}/confirm",
                         query: "tag=#{self.return_tag}")
    uri.to_s
  end
end
