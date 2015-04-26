require 'rails_helper'

describe StoriesController, type: :controller do

  login_user
  
  describe 'GET #index' do
    
    it "populates an array of all stories" do
      ulysses = create(:story, title: "Ulysses")
      portrait = create(:story, title: "Portrait")
      get :index
      expect(assigns(:stories)).to match_array([ulysses, portrait])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do

    it "assigns the requested story to @story" do
      story = create(:story)
      get :show, id: story
      expect(assigns(:story)).to eq story
    end

    it "renders the :show template" do
      story = create(:story)
      get :show, id: story
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    
    it "assigns a new story to @story" do
      get :new
      expect(assigns(:story)).to be_a_new(Story)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do

    it "assigns the requested story to @story" do
      story = create(:story)
      get :edit, id: story
      expect(assigns(:story)).to eq story
    end
    
    it "renders the :edit template" do
      story = create(:story)
      get :edit, id: story
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do

    context 'with valid attributes' do

      it "saves the new story in the database" do
        expect{
          post :create, story: attributes_for(:story)
        }.to change(Story, :count).by(1)
      end

      it "redirects to stories#show" do
        post :create, story: attributes_for(:story)
        expect(response).to redirect_to story_path(assigns[:story])
      end
    end

    context 'with invalid attributes' do

      it "does not save the new story in the database" do
        expect {
          post :create, story: attributes_for(:invalid_story)
        }.not_to change(Story, :count)
      end

      it "re-renders the :new template" do
        post :create, story: attributes_for(:invalid_story)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before(:each) do
      @story = create(:story, title: "Ulysses")
    end
    
    context 'with valid attributes' do
      
      it "locates the requested @story" do
        patch :update, id: @story, story: attributes_for(:story)
        expect(assigns(:story)).to eq(@story)
      end
      
      it "updates the story in the database" do
        patch :update, id: @story, story: attributes_for(:story, title: "Finnegan's Wake")
        @story.reload
        expect(@story.title).to eq("Finnegan's Wake")
      end
      
      it "redirects to the story" do
        patch :update, id: @story, story: attributes_for(:story)
        expect(response).to redirect_to @story
      end
    end

    context 'with invalid attributes' do
      
      it "does not update the story" do
        patch :update, id: @story, story: attributes_for(:invalid_story)
        @story.reload
        expect(@story.title).to eq("Ulysses")
      end

      it "re-renders the :edit template" do
        patch :update, id: @story, story: attributes_for(:invalid_story)
        expect(response).to render_template :edit
      end

    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @story = FactoryGirl.create(:story)
    end

    it "deletes the story from the database" do
      expect {
        delete :destroy, id: @story
      }.to change(Story, :count).by(-1)
    end

    it "redirects to root path" do
      delete :destroy, id: @story
      expect(response).to redirect_to root_url
    end
  end
end