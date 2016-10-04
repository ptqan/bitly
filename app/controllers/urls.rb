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
		# @flash_msg = "successful"
		# @urls = Url.all
		# erb :"static/index"
		return @url.to_json
	else
		@flash_msg = "error"
		# @urls = Url.all
		# erb :"static/index"
		return @flash_msg.to_json
	end
	#after saving go to a new page
end

get '/:short_url' do
	#Url.count += 1
	
	@url = Url.find_by(short_url: params[:short_url])
	@url.url_count += 1

	@url.save
	#redirect to appropriate "long url"
	redirect to @url.long_url
end

