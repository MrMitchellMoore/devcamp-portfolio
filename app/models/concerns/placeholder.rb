module Placeholder
	extend ActiveSupport::Concern

	def self.image_generator(height:, width:)
		"https://source.unsplash.com/random/#{height}x#{width}"
	end
end