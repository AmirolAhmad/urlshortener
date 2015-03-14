class Referer < ActiveRecord::Base
	after_create :shorten

	validates :url, :format => URI::regexp(%w(http https))

	def shorten
		rand_slug = (0...5).map { ('a'..'z').to_a[rand(26)] }.join
    self.slug = rand_slug
    self.save
  end

  def shorten_url
		Settings.site_domain + self.slug
	end
end
