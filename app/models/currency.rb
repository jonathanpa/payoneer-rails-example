class Currency < ActiveRecord::Base
  has_many :payees

  validates :code, presence: true, uniqueness: { case_sensitive: false }
end
