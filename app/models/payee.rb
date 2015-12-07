class Payee < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  after_create :sign_up

  def payout
    payment_id = SecureRandom.hex(8)
    response = Payoneer::Payout.create(
      program_id: Rails.application.secrets.program_id,
      payment_id: payment_id,
      payee_id: self.email,
      amount: self.balance,
      description: "Test payout to #{self.email} with amount #{self.balance}",
      payment_date: Time.now,
      currency: 'USD'
    )
    Rails.logger.debug "PAYONEER : Payout #{payment_id} => Code : #{response.code},\
      Description: #{response.body}"
    response
  end

  private

  def sign_up
    response = Payoneer::Payee.signup_url(self.email)
    self.sign_up_url = response.body if response.ok?
    self.return_tag = SecureRandom.hex(8)
    save!
  end
end
