class TermTogglersController < ApplicationController
  
  def create
    session[:current_term] = Term.find(params[:term_toggler][:term_id])
    redirect_to :back
  end
  
end
