require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each {|file| require file}
also_reload "/lib/**/*.rb"

get("/") do
  @cities = City.all
  @carads = CarAd.all()
  if @carads.any?
    @count = CarAd.count()
  else
    @count = 1
  end
  erb(:index)
  #binding.pry
end

get "/delete_all" do
  CarAd.delete_all()
  redirect "/"
end

get "/scrape" do
  CarAd.scrape()
  redirect "/"
end


get "/shutdown" do
  exit!
end

get "/viz" do
  erb :data_visualization
end

get "/generate_tsv" do
  City.generate_tsv
end
