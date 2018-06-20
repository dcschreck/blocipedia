class WikiPolicy < ApplicationPolicy
    attr_reader :user, :wiki

    def initialize(user, record)
      @user = user
      @record = record
    end

    def show?
        user.present?
    end 

    def new?
        user.present?
    end

    def destroy?
        user.role == 'admin' || record.user == user
    end

    class Scope < Scope
        def resolve
            scope
        end
    end
end
