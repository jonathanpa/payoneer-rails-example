describe Payout do
  it { should validate_presence_of(:payment_id) }
  it { should validate_uniqueness_of(:payment_id).case_insensitive }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:payee) }
  it { should validate_presence_of(:currency) }
end
