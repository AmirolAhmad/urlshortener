module ReferersHelper

	def total_url_shorten
		Referer.count
	end

end
