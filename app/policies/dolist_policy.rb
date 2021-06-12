class DoListPolicy < ApplicationPolicy
    
    def new?
        user.type=="Expert" && user.id==Campaign.find(record.campaign_id).user_id
    end
    

    def create?
       user.type=="Expert" && user.id==Campaign.find(record.campaign_id).user_id
    end
    
    def edit?
        user.type=="Expert" && user.id==Campaign.find(record.campaign_id).user_id
    end
    
    def update?
        user.type=="Expert" && user.id==Campaign.find(record.campaign_id).user_id
    end

    def destroy?
        user.type=="Expert" && user.id==Campaign.find(record.campaign_id).user_id
    end

end