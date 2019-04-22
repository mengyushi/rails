class TemperatureController < ApplicationController
  def new 
    @temperature = Temperature.new
  end
  
  def index
    @temperature_all = Temperature.all
  end
  
  def edit
    @temperature = Temperature.find(params[:id])
  end
  
  def create
    @temperature = Temperature.new(temperature_params)
    
    if @temperature.save
      redirect_to @temperature
    else
      render 'new'
    end
    
  end
  
  def show
    @temperature = Temperature.find(params[:id])
  end
  
  def update
    @temperature = Temperature.find(params[:id])
    
    if @temperature.update(temperature_params)
      redirect_to @temperature
    else
      render 'edit'
    end
      
  end
  
  def destroy
    @temperature = Temperature.find(params[:id])
    @temperature.destroy
    
    redirect_to 
  end
  
  private
  def temperature_params
    params.require(:temperature).permit(:date, :temp)
  end
  
end
