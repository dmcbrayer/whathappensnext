require 'rails_helper'

RSpec.describe Story, type: :model do
  let(:story) {create(:story)}

  describe "Model attributes set up" do
    subject {story}

    it {is_expected.to respond_to(:id)}
    it {is_expected.to respond_to(:title)}
    it {is_expected.to respond_to(:description)}

    it {is_expected.to be_valid}
  end

  describe "Activity validations" do
    
    it "has a valid factory" do
      story = create(:story, title: "New Story")
      expect(story).to be_valid
    end

    it "is invalid without a title" do
      expect(FactoryGirl.build(:story, title: nil)).not_to be_valid
    end

    it "is associated with a user" do
      expect(story.user_id).not_to be_nil
    end

    context "format validations" do

      it "#title returns a string" do
        expect(story.title).to be_a(String)
      end

      it "#description returns a text block" do
        expect(story.description).to be_a(String)
      end
    end
  end
end
