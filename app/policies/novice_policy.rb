class NovicePolicy < ApplicationPolicy
    
    def index?
        user.type=="Expert"
    end

    def show?
        user.id==record.id || user.type=="Expert"
    end

    def edit?
        user.id==record.id || user.type=="Expert"
    end
    
    def update?
        user.id==record.id || user.type=="Expert"
    end

    def destroy?
        user.type=="Novice" && user.id==record.id
    end
end
