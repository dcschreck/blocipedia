class User < ApplicationRecord
    after_initialize do
        if self.new_record?
            self.role ||= :standard
        end
    end

    has_many :wikis
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

    enum role: [:standard, :premium, :admin]
end
