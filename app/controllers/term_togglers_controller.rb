class TermTogglersController < ApplicationController
  
  def create
    p "@@@@@@ before"
    p current_term
    current_term=(Term.find(params[:term_toggler][:term_id]))
    p current_term
    p "@@@@@@ after"
    redirect_to user_url(User.first)
  end
  
end
