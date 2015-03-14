class WelcomeController < ApplicationController
  def index
  	@referers = Referer.all
  end
end
