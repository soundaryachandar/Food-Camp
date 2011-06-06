class FoodTypeController < ApplicationController
  require 'csv'
  
  def upload
    @title = "File Upload"
  end

  def upload_file
    @csv_file = CSV.read(params[:upload][:food_type])
    @headers = @csv_file.shift
    @csv_file.each do |row|
      FoodType.create!(:foodkind => row[0],:name => row[1],:location => row[2],:city => row[3])
    end
    @food_type = FoodType.find(:all)
    render 'show'
  end

  def show
    @food_type = FoodType.find(:all)
  end
end
