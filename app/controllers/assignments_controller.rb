class AssignmentsController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    
    def index
        @assignments = Assignment.paginate(:page => params[:page]).per_page(10)
    end

    def show

    end
    
    def edit
    
    end
    
    def new
        @assignments = Assignment.new
    end
    

  def create
    @assignments = Assignment.new(assignment_params)
    if @assignments.save
        
      redirect_to employee_path(@assignments), notice: "#{@assignments.start_date} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @assignments.update(assignment_params)
        
      redirect_to employee_path(@asg), notice: "#{@asg.start_date} was revised in the system."
    
    else
      render action: 'edit'
    end
  end
  def destroy
    @assignments.destroy
    redirect_to assignments_url
  end
  
    private
    def assignment_params
        params.require(:assignments).permit(:start_date, :end_date, :active)
    end
    
     def set_assignment 
        @categories = Category.find(params[:id]) 
     end
     
end
