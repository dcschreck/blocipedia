require 'rails_helper'

RSpec.describe Wiki, type: :model do
    let(:user) { User.create!(email: RandomData.random_email, password: "password") }
    let(:wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:user) }

    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_length_of(:body).is_at_least(20) }

    describe "attributes" do
        it "has title, body, and user attributes" do
            expect(wiki).to have_attributes(title: wiki.title, body: wiki.body)
        end
    end
end
