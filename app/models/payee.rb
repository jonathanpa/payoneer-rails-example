class Payee < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  after_create :sign_up

  private

  def sign_up
    response = Payoneer::Payee.signup_url(self.email)
    self.sign_up_url = response.body if response.ok?
    self.return_tag = SecureRandom.hex(8)
    save!
  end
end
