module ApplicationHelper
  def terms
    Term.find_all_by_client_id(current_user.id)
  end
end
