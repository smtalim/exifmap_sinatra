# sorter.rb
require 'sinatra'
require 'exifr'

not_found do
  erb :'404'
end

error do
  'Sorry there was a nasty error - ' + env['sinatra.error'].name
end

get '/' do
  erb :index
end

post '/show' do
  begin
    if params[:photo]
      photo = EXIFR::JPEG.new(params[:photo][:tempfile])
      lat = photo.gps.latitude.to_s
      lng = photo.gps.longitude.to_s
      @photo_map = "http://maps.googleapis.com/maps/api/staticmap?sensor=false&zoom=5&size=600x300&maptype=roadmap&center=#{lat},#{lng}&markers=color:blue%7Clabel:I%7C#{lat},#{lng}"
      erb :show
    end
  rescue NoMethodError
    halt erb(:nomethod)
  end
end 


