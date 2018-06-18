class WikiPolicy < ApplicationPolicy
    # attr_accessor :user, :wiki

    def destroy?
        user.role == 'admin' || record.user == user
    end

    class Scope < Scope
        def resolve
            scope
        end
    end
end
