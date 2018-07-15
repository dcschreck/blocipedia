class User < ApplicationRecord
    after_initialize do
        if self.new_record?
            self.role ||= :standard
        end
    end

    before_update :publish_wikis

    has_many :wikis

    has_many :collaborators
    has_many :wiki_collabs, source: :wiki, through: :collaborators

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

    enum role: [:standard, :premium, :admin]

    private
    def publish_wikis
        return unless role_was == 'premium' && role == 'standard'
        wikis.update_all(private: false)
    end
end
