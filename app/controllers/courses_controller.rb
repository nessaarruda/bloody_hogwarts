class CoursesController < ApplicationController

  def index
    @courses = Course.all.order_by_name
  end
end
