class StudentsController < ApplicationController

  def index
    @students = Student.all.order_by_name
  end

  def show
    @student = Student.find(params[:id])
  end
end
