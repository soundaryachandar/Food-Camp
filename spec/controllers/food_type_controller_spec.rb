require 'spec_helper'
require 'csv'

describe FoodTypeController do

  render_views

  
  describe "GET 'upload'" do 

    it "should be successful" do |object|
      get 'upload'
      response.should be_success
    end
  end

  describe "POST 'upload'" do

    file_path = "/Users/soundaryachandar/rails_projects/Food-Camp/spec/helpers/"
   
    describe "success" do
      before(:each) do
         @attr = { :food_type => Rack::Test::UploadedFile.new(file_path + "test.csv","multipart/form-data") }
      end
      
      
      it "should render the index template" do
        post :upload_file,:upload => @attr
        response.should render_template('index')
      end

      it "should upload the contents and change the count" do
        lambda do
          post :upload_file,:upload => @attr
        end.should change(FoodType,:count)
      end

      it "should have a flash message stating file upload success" do
        post :upload_file, :upload => @attr
        flash[:success].should =~ /successful/i
      end
      
    end
    describe "failure" do
      
      describe "csv validation for invalid file extensions" do
        
        before(:each) do
          @attr = { :food_type => Rack::Test::UploadedFile.new(file_path + "test.dat","multipart/form-data") }
        end
      
        it "should reject a non-csv file" do
          post :upload_file, :upload => @attr
          response.should render_template('upload')
        end

        it "should flash an error message" do
          post :upload_file, :upload => @attr
          flash[:error].should =~ /invalid/i
        end

        it "should not upload the file contents" do
          lambda do
            post :upload_file,:upload => @attr
          end.should_not change(FoodType,:count)
        end
      end #invalid file extensions
      
      describe "csv validation for no file selected" do
        
        it "should upload only when a file is selected" do
          post :upload_file
          response.should render_template('upload')
        end

        it "should display a flash error message when no file is selected" do
          post :upload_file
          flash[:error].should =~ /invalid/i
        end

        it "should not change the count of FoodType" do
          lambda do
            post :upload_file
         end.should_not change(FoodType,:count) 
        end
      end #no file selected
    end #failure
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
