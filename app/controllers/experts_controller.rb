class ExpertsController < ApplicationController
  before_action :find_expert, only: [:edit, :update, :show, :destroy]
  
  def index
    @experts = Expert.all
    authorize @experts
  end

  def show
  end

  def new
   @expert = Expert.new()
  end

  def create
    @expert = Expert.new(expert_params)
    if @expert.save
      flash[:success] = "Expert successfully created"
      redirect_to @expert
    else
      flash[:error] = "Oops Expert Creation Failed"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @expert.update(expert_params)
      sign_in(@expert, :bypass => true)
      flash[:success] = "Expert successfully updated"
      redirect_to @expert
    else
      flash[:error] = "Oops Updataion Failed"
      render 'edit'
    end
  end

  def destroy
    @expert = Expert.find(params[:id])
    authorize @expert

  if @expert.destroy
    flash[:success] = 'Expert successfully Deleted.'
    redirect_to experts_url
  else
    flash[:error] = 'Oops Deletion Failed'
    redirect_to experts_url
  end
  end
  
  def find_expert
    @expert = Expert.find(params[:id])        
    authorize @expert

  end

  private

  def expert_params
     params.require(:expert).permit(:name,:email,:password,:profession,:service,:type)
  end
end