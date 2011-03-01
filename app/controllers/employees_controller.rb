class EmployeesController < ApplicationController
  before_filter :authenticate_employee!

  def index
  end

end
