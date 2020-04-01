class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
  def index
        @employees = Employee.active.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    def show

    end
    
    def edit
    
    end
    
    def new
        @employees = Employee.new
    end
    def detail
    end
    

  def create
    @employees = Employee.new(employee_params)
    if @employees.save
        
      redirect_to employee_path(@employees), notice: "#{@employees.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @employees.update(employee_params)
        
      redirect_to employee_path(@employees), notice: "#{@employees.name} was revised in the system."
    
    else
      render action: 'edit'
    end
  end
  def destroy
    @employees.destroy
    redirect_to authors_url
  end
  
    private
    def employee_params
    params.require(:employee).permit(:first_name, :last_name, :ssn, :date_of_birth,:phone)
  end
  def set_employee
        @employees= Employee.find(params[:id]) 
     end
end
