class DiscussionTopicsController < ApplicationController
  before_action :find_campaign ,only:[:index ,:new , :create , :find_discussion_topic]
  before_action :find_discussion_topic,only:[:edit, :update,:show,:destroy]
  def index
    @discussion_topics = @campaign.discussion_topics.all
  end
  def new
   @discussion_topic = @campaign.discussion_topics.new
  end
  def show
  end
  def create
   @discussion_topic = @campaign.discussion_topics.new(discussion_topic_params)
   authorize @discussion_topic
   @discussion_topic.topic_creator_type = current_user.type
   @discussion_topic.topic_creator_id = current_user.id
   if @discussion_topic.save
      flash[:success] = "Topic Created Successfully"
      redirect_to campaign_discussion_topics_path(@campaign)
    else
      flash[:error] = "Oops Topic creation failed"
      render 'new'
    end  
  end

  def edit
   authorize @discussion_topic
  end
  def update
    authorize @discussion_topic
    if @discussion_topic.update(topic_params)
      flash[:success] = "Topic Updated Successfully"
      redirect_to discussion_topic_path(@campaign , @discussion_topic) 
    end    
      flash[:error] = "Oops Topic Updation Failed"
      render 'edit'
    end
  def destroy
    authorize @discussion_topic
    if @disucssion_topic.destroy
      flash[:success] ="Topic Deleted Successfully"
      redirect_to campaign_discussion_topics_path(@campaign)
    else
      flash[:error] = "Oops Deletion Failed"
      redirect_to campaign_discussion_topics_path(@campaign)    
    end
        
  end
  
  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])      
  end
  
  def find_discussion_topic
    @campaign = Campaign.find(params[:campaign_id])
    @discussion_topic = @campaign.discussion_topics.find(params[:id]) 
  end
  private
  def discussion_topic_params
    params.require(:discussion_topic).permit(:title)
  end

end