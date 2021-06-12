class ExpertPolicy < ApplicationPolicy
    
    def index?
        user.type=="Expert"
    end

    def show?
        user.type=="Expert"
    end
    
    def edit?
        user.type=="Expert" && user.id==record.id
    end
    
    def update?
        user.type=="Expert" && user.id==record.id
    end

    def destroy?
        user.type=="Expert" &&  user.id==record.id
    end
end
