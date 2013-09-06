module TermTogglersHelper
  
  def current_term=(term)
    @current_term = term
    p "@@@@@@@"
    @current_term
  end
  
  def find_current_term
    Term.where("client_id = ? AND reg_start <= ? AND end_date > ?", 
                  current_user.client_id,
                  Date.today.to_s,
                  Date.today.to_s).first
  end
  
  def find_latest_term
    Term.find_all_by_client_id(current_user.client_id).last
  end
  
  def current_term
    @current_term = @current_term || find_current_term || find_latest_term
  end
  
end
