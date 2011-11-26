require 'spec_helper'

describe SearchesController do
  render_views

  describe "GET new" do
    it "has new search model" do
      get :new
      assigns[:search].should be_new_record
    end
  end

  describe "create action" do
    it "redirects to search after create" do
      post "create", :search => {:keywords => "Acoustic"}

      response.should redirect_to(assigns[:search])
      assigns[:search].should_not be_new_record
    end
  end

  describe "search"
end