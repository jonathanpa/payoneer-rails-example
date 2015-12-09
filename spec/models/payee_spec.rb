describe Payee do
  before { allow_any_instance_of(Payee).to receive(:sign_up) }

  it { should belong_to(:currency) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:balance) }
  it { should validate_numericality_of(:balance).
       is_greater_than_or_equal_to(20.0) }
  it { should validate_presence_of(:currency) }
end
