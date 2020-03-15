class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
  end

  def activate
    @student = Student.find params[:id]
    if @student.active == false
      @student.update_attribute(:active, true)
    else
      @student.update_attribute(:active, false)
    end
    @student.save
    redirect_to "/students/#{@student.id}"
  end

  # def active
  #   @student = Student.find params[:id]
  #   if @student.active == false
  #     @student.update_attribute(:active, true)
  #   else
  #     @student.update_attribute(:active, false)
  #   end
  #   @student.save
  #   redirect_to @show
  # end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end