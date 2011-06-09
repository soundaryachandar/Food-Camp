require 'spec_helper'

describe FoodTypeController do

  render_views

  
  describe "GET 'upload'" do 

    it "should be successful" do |object|
      get 'upload'
      response.should be_success
    end

    it "should have the title 'File Upload'" do |object|
      get :upload
      response.should have_selector("title",:content => "File Upload")
    end
  end

  describe "GET 'home'" do

    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => "FoodCamp")
    end
    
  end
  
end
