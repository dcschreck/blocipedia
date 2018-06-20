class WikiPolicy < ApplicationPolicy
    attr_reader :user, :wiki

    def initialize(user, record)
        @user = user
        @record = record
    end

    def index?
        false
    end

    def show?
        user.present?
    end

    def new?
        user.present?
    end

    def create?
        user.present?
    end

    def edit?
        user.present?
    end

    def update?
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
