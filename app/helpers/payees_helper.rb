module PayeesHelper
  def signed?(payee)
    if payee.signed
      'Signed'
    elsif payee.sign_up_url.present?
      link_to('Payoneer sign up', payee.sign_up_url)
    else
      'No link ...'
    end
  end
end
