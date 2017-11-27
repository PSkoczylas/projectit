require 'rails_helper'

describe ProjectsController do
  render_views

  let!(:user) { create(:user) }
  let!(:project1) { create(:project) }
  let!(:project2) { create(:project) }

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "responds successfuly HTTP 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    it "responds successfuly HTTP 200 status code" do
      get :new, format: :html
      response.status.should eq(200)
    end
  end

  describe "DELETE #destroy" do
    it "responds successfuly HTTP 200 status code" do
      delete :destroy, format: :html, params: { id: project1.id }
      response.status.should eq(302)
    end
  end

  describe "GET #edit" do
    it "responds successfuly HTTP 200 status code" do
      get :edit, format: :html, params: { id: project2.id }
      response.status.should eq(200)
    end
  end
end
