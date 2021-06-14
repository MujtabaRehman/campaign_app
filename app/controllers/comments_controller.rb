class CommentsController < ApplicationController
  before_action :find_commentable,only: [:index , :new , :create , :find_comment]
  before_action :find_comment,only: [:edit , :update, :destroy , :show]
  def create
    @comment = Comment.new(comment_params)
    @comment.commentable_id = @commentable.id
    @comment.commentable_type = @commentable.class.name
  
    @comment.commented_id = current_user.id
    @comment.commented_type = current_user.type

    if comment.save
      flash[:success] = "Comment created successfully"
      @commentable.class.name == "Campaign"?(redirect_to campaign_path(@commentable)): (redirect_to campaign_topic_path(params[:campaign_id], @commentable))
    else
      flash[:error] = "Comment Creation Failed"
      render 'new'
    end
  end

  def show
  end
  def edit
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment Deleted"
      @commentable.class.name == "Campaign" ? redirect_to campaign_path(@commentable) : redirect_to campaign_dicsussion_topic_path(params[:campaign_id] , @commentable)
    else
      flash[:error] = "Comment Deletion Failed"
      @commentable.class.name =="Campaign"?(redirect_to campaign_path(@commentable))
      :(redirect_to campaign_dicsussion_topic_path(params[:campaign_id] , @commentable))
    end
  end

  def filter_commentable
    if params[:discussion_topic_id]
      return "Discussion Topic" 
    else
      return "Campaign"
    end
  end

  def find_commentable    
    if filter_commentable == "Discussion Topic"
      return @commentable = Topic.find(params[:discussion_topic_id])
    else
      return @commentable = Campaign.find(params[:campaign_id])
    end
  end

  def find_comment
   @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id]) 
  end

  private
  def comment_params
    params.require(:comment).permit(:title)
  end

end