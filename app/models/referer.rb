class Referer < ActiveRecord::Base
	after_create :shorten

	validates :url, :format => URI::regexp(%w(http https))

	def shorten
    self.slug = self.id.to_s(12)
    self.save
  end

  def shorten_url
		Settings.site_domain + self.slug
	end
end
