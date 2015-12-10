class Payout < ActiveRecord::Base
  belongs_to :payee
  belongs_to :currency

  validates :payment_id, presence: true, uniqueness: { case_sensitive: false }
  validates :amount, presence: true
  validates :payee, presence: true
  validates :currency, presence: true
end
