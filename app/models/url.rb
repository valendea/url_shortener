class Url < ApplicationRecord

	validates :long_url, presence: true
	validates :long_url, uniqueness: {case_sensitive: false, message: "was shortened before"}
	validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "format is not good"}
	# This is Sinatra! Remember to create a migration!
	
	def shorten
		summ = ("a".."z").to_a + ("A".."Z").to_a + ("1".."9").to_a
		summ.flatten!
		randomize = summ.sample(7)
		randomize_string = randomize.join

		self.short_url = randomize_string 
		self.save
	end
	
end
