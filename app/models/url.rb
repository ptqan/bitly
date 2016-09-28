require 'securerandom'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	before_save :shorten
	validates :long_url, uniqueness: true, presence: true
	validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "format is not good"}

	def shorten
		#Write a method here
		short = SecureRandom.hex(3) #gives double of value
		self.short_url = short
	end
end
