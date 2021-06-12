class CampaignsController < ApplicationController
  def index
   @campaigns = Campaign.all
  end
  def new
   authorize @campaign = Campaign.new
  end
  def create
    @campaign = Campaign.new(campaign_params)
    authorize @campaign
    @campaign.user_id = current_user.id
    if @campaign.save
      flash[:success] = "Campaign Created"
      redirect_to @campaign
    else
        flash[:error] = "Campaign Failed"
        render 'new'
    end
  end
    
  def show
   @campaign = Campaign.find(params[:id])
  end
    
  def edit
   authorize @campaign = Campaign.find(params[:id])
  end
    
  def update
    authorize @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      flash[:success] = "Campaign Updated"
      redirect_to @campaign   
    else
      flash[:error] = " Oops Campaign Updation Failed"
      render 'edit'
    end      
  end

  def destroy
    authorize @campaign = Campaign.find(params[:id])
    if @campaign.destroy
      flash[:success] = "Campaign Deleted"
      redirect_to campaigns_url
    else
      flash[:error] = "Oops Deletion Failed"
      redirect_to campaign_url
    end
  end
  private 
  def campaign_params
    params.require(:campaign).permit(:title , :purpose , :estimated_time)
  end
end
