class FoodTypeController < ApplicationController
  require 'csv'
  
  def upload
    @title = "File Upload"
  end

  def upload_file
   if params[:upload].present? then 
     @file_object = params[:upload][:food_type]

     if valid_csv_file?(@file_object) then
    
       @csv_contents = CSV.read(@file_object)
       @headers = @csv_contents.shift
       @csv_contents.each do |row|
          FoodType.create!(
                           :foodkind => row[0],
                           :name => row[1],
                           :location => row[2],
                           :city => row[3],
                           :tag_list => row[0])
        end
       flash[:success] = "File Upload was successful"
       redirect_to food_type_index_path  
     else
       flash[:error] = "Invalid CSV file. Please check the file."
       render 'upload'
     end
   else
     flash[:error] = "Invalid File. Please select a file to upload"
     render 'upload'
   end 
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
  

  def valid_csv_file?(file)   
    if File.extname(file) == ".csv" then
      return true
    else
      return false      
    end
  end
end
