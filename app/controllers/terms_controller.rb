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
  end
  
  def update
  end
  
end
