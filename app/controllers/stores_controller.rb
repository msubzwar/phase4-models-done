class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update, :destroy]
    
    def index
        @stores = Store.active.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    
    def show
    end
    
    def edit
    
    end
    
    def new
        @stores = Store.new
    end
    
    
def create
    @stores = Store.new(store_params)
    if @stores.save
        
      redirect_to store_path(@stores), notice: "#{@stores.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @stores.update(store_params)
        
     # redirect_to store_path(@stores), notice: "#{@store.name} was revised in the system."
    
    else
      render action: 'edit'
    end
  end
  def destroy
    @stores.destroy
    redirect_to stores_url
  end
  
    private
    def store_params
    params.require(:store).permit(:name, :street, :city, :state, :zip, :phone, :active)
  end
  def set_store
        @stores= Store.find(params[:id]) 
     end
end

