class TermsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @terms = Term.find_all_by_client_id(current_user.client_id)
    @term = Term.new
  end
  
  def create
    params[:term][:client_id] = current_user.client_id
    @term = Term.new(params[:term])
    @term.save
    redirect_to terms_url
  end
  
  def edit
    @term = Term.find(params[:id])
  end
  
  def update
    @term = Term.find(params[:id])
    @term.update_attributes(params[:id])
    @term.save
    redirect_to terms_url
  end
end
