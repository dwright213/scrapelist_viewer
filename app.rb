require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
also_reload "/lib/**/*.rb"

get '/' do

  erb :index
end
