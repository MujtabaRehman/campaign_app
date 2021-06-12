class DoListsController < ApplicationController

  before_action :find_campaign, only: [:index, :new, :create, :find_do_list]
  before_action :find_do_list, only: [:edit, :update, :show,:destroy]
  
  def index
   @do_lists = @campaign.do_lists.all
  end
  
  def new
   @do_list =  @campaign.do_lists.new
  end

  def show
  end


  def create
   @do_list = @campaign.do_lists.new(do_list_params)
    if @do_list.save
      flash[:success] = "Goals successfully created"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = "Goal creation Failed"
      render 'new'
    end
  end

  def edit
    authorize @do_list
  end

  def update
    authorize @do_list
    if @do_list.update(do_list_params)
      flash[:success] = "Goal Successfully updated"
      redirect_to @campaign
    else
      flash[:error] = "Oops Updataion Failed"
      render 'edit'
    end
  end

  def destroy
    authorize @do_list
    if @do_list.destroy
     flash[:success] = 'Goal Successfully deleted.'
     redirect_to @campaign
    else
      flash[:error] = 'Oops Deletion Failed'
      redirect_to do_lists_url
    end
  end

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])      
  end
  
  def find_do_list
    @campaign = Campaign.find(params[:campaign_id])
    @do_list = @campaign.do_lists.find(params[:id]) 
  end

  private

  def do_list_params
    params.require(:do_list).permit(:title,:description,:completed,:campaign_id)
  end
end