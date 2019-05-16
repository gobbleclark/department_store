class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  def index
    @departments = Department.all
  end

  def show
    #@department = Department.find(params[:id])
  end

  def new
    @department = Department.new
    render partial: "form"
  end

  def edit
    #@department = Department.find(params[:id])
      render partial: "form"
  end

  def create
     @department = Department.new(department_params)
      if @department.save
      redirect_to departments_path
      else render partial: "form"
      end

  end

  def update
    #@department = Department.find(params[:id])
    if @department.update(department_params)
      redirect_to departments_path(@department.id)
    else 
      render partial: "form"
    end 
  end

  def destroy
    #@department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_path

  end 
  
  private
  def department_params
    #params = {departments: { name: "Department Name"}}
    params.require(:department).permit(:name)
   end 
 
   def set_department
    @department = Department.find(params[:id])
   end
end
