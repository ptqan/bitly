#root page
get '/' do
	@urls = Url.all
	erb :"static/index"
end

post '/urls' do
	#create a new Url
	#key in the long url into the database
	@url = Url.new(long_url: params[:url])
	if @url.save #save the url
		#it will go my model url and run my before save method
		@flash_msg = "successful"
		@urls = Url.all
		erb :"static/index"
	else
		@flash_msg = "not successful"
		@urls = Url.all
		erb :"static/index"
	end
	#after saving go to a new page
end

get '/:short_url' do
byebug
	url = URl.find_by(short_url: params[:short_url])
	#redirect to appropriate "long url"
	redirect_to Url.long_url
end

# get '/' do
#   erb :"static/index"
#   #let user create new short URL, display a list of shortened URLs
# end

# post '/urls' do
# 	#create a new Url
# 	Url.shorten
# end

# get '/:short_url' do
# byebug
# 	url = URl.find_by(short_url: params[:short_url])
# 	#redirect to appropriate "long url"
# 	redirect_to Url.long_url
# end

