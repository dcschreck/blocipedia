class User < ApplicationRecord
    after_initialize do
        if self.new_record?
            self.role ||= :standard
        end
    end

    after_update :private_to_public

    has_many :wikis
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

    enum role: [:standard, :premium, :admin]

    private
    def private_to_public
        if self.standard?
            self.wikis.update_all private: "false"
        end
    end
end
