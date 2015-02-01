require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each {|file| require file}
also_reload "/lib/**/*.rb"

get("/") do
  @carads = CarAd.all()
  erb(:index)
end

get "/delete_all" do
  CarAd.delete_all()
  redirect "/"
end

get "/scrape" do
  system('ruby scrape.rb')
  redirect "/"
end


get "/shutdown" do
  exit!
end
