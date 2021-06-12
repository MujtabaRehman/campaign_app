class DiscussionTopicPolicy < ApplicationPolicy
    def new?
        user.type=="Novice"  && user.qualified?
    end

    def create?
      user.type=="Novice" && user.qualified?
    end

    def edit?
      record.topic_creator_id==user.id
    end
    
    def update?
      record.topic_creator_id==user.id
    end

    def destroy?
        record.topic_creator_id == user.id 
    end
end