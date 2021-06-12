class NovicesController < ApplicationController
  before_action :find_novice, only: [:edit, :update, :show, :destroy]
  def index
    @novices = Novice.all
     authorize @novices
  end
  def show
  end

  def new
   @novice = Novice.new()
  end

  def create
    @novice = Novice.new(novice_params)
    if @novice.save
      flash[:success] = "Novice successfully created"
      redirect_to @novice
    else
      flash[:error] = "Oops Creation Failed"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @novice.update(novice_params)
      current_user.type=="Expert"? sign_in(current_user, :bypass => true) : sign_out(current_user) 
      flash[:success] = "Novice successfully updated"
      redirect_to @novice
    else
      flash[:error] = "Oops Updataion Failed"
      render 'edit'
    end
  end

  def destroy
    @novice = Novice.find(params[:id])
    authorize @novice
    if @novice.destroy
      flash[:success] = 'Novice successfully deleted.'
      redirect_to novices_url
    else
      flash[:error] = 'Oops Deletion Failed'
      redirect_to novices_url
    end
  end
    
  def find_novice
    @novice = Novice.find(params[:id]) 
    authorize @novice       
  end
  private

  def novice_params
   current_user.type=="Novice"? params.require(:novice).permit(:name,:email,:password,:type) : params.require(:novice).permit(:name,:email,:status)
  end
end