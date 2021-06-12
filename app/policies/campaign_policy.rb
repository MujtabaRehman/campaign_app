class CampaignPolicy < ApplicationPolicy
  def new?
    user.type=="Expert"
  end
  def create?
    user.type == "Expert"
  end

  def edit?
      user.type == "Expert" && user.id==record.user_id
  end
  
  def update?
      user.type=="Expert" && user.id==record.user_id
  end

  def destroy?
      user.type=="Expert" && user.id==record.user_id
  end
end