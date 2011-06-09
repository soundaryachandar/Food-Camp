class FoodTypeController < ApplicationController
  require 'csv'
  
  def upload
    @title = "File Upload"
  end

  def upload_file
    @file_object = params[:upload][:food_type]
    @csv_contents = CSV.read(@file_object)
     @csv_contents.each do |row|
      FoodType.create!(:foodkind => row[0],:name => row[1],:location => row[2],:city => row[3], :tag_list => row[0])
    end
    redirect_to food_type_index_path
  end

  def index
    @food_types = FoodType.all

    respond_to do |format|
      format.html
    end
  end

  def home
    @title = "Home"
  end
end
