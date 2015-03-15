class Referer < ActiveRecord::Base
	after_create :shorten

	default_scope -> { order('`referers`.created_at DESC') }

	validates :url, :format => URI::regexp(%w(http https))

	def shorten
		rand_slug = (0...5).map { ('a'..'z').to_a[rand(26)] }.join
    self.slug = rand_slug
    self.save
  end

  def shorten_url
		Settings.site_domain.to_s + self.slug
	end
end
