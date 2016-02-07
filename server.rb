require "sinatra"
require "csv"
require "pry"
require_relative "classes/read_erb"

before do
  @user_quantity_input
  @grocery_name = []
end


get "/" do

  redirect "/groceries"
end

get "/groceries" do

  @current_groceries = ReadErb.new
  @user_quantity_input

  erb :groceries
end

post "/submit" do

  name = params['grocery_name']
  quantity = params['grocery_quantity']
  @user_quantity_input = quantity

  if name == "".strip
    redirect "/error"
  else
    CSV.open("grocery_list.csv", "a") do |csv|
      csv << [name, quantity]
    end
  end

  redirect "/groceries"
end


# get "/:grocery_name" do
#   @grocery_name << params[:grocery_name]
#
#   erb :details
# end

get "/error" do

  erb :error
end
