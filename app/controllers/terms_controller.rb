class TermsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @terms = Term.all
  end
  
  def new
    @term = Term.new
  end
  
  def create
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
