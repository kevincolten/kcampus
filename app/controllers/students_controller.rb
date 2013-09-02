class StudentsController < ApplicationController
  before_filter :require_current_user!
end
