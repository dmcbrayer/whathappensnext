require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) {create(:post)}
  let(:story) {post.story}

  describe "Model attributes set up" do
    subject {post}

    it {is_expected.to respond_to(:id)}
    it {is_expected.to respond_to(:body)}

    it {is_expected.to be_valid}
  end

  describe "Activity validations" do

    it "is invalid without a body" do
      expect(FactoryGirl.build(:post, body: nil)).not_to be_valid
    end

    it "is associated with a story" do
      expect(post.story_id).to eq(story.id)
    end

    context "format validations" do

      it "#body returns a string" do
        expect(post.body).to be_a(String)
      end

    end
  end
end

