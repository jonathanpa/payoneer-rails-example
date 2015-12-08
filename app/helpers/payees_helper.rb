module PayeesHelper
  def signed?(payee)
    if payee.signed
      'Signed'
    else
      link_to('Payoneer sign up', payee.sign_up_url)
    end
  end
end
