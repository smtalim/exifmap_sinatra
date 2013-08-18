# sorter.rb
require 'sinatra'
require 'exifr'

not_found do
  erb :'404'
end

error do
  erb :'500'
end

get '/' do
  erb :index
end

post '/show' do
  if params[:photo]
    @photo = EXIFR::JPEG.new(params[:photo][:tempfile])
    erb :show
  end
end 


