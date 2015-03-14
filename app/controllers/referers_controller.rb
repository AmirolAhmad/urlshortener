class ReferersController < ApplicationController
  def index
  	@referers = Referer.all
  end

  def new
  	@referer ||= Referer.new
  	render
  end

  def create
  	@referer = Referer.new(referer_params)
  	if @referer.save
  		redirect_to referers_path, notice: "Link #{@referer.url} has been shorten to #{@referer.shorten_url}"
  	else
  		render 'new'
  	end
  end

  def show
  	if params[:slug]
      @referer = Referer.find_by(slug: params[:slug])
      if redirect_to @referer.url
        @referer.click += 1
        @referer.save
      end
    else
      @referer = Link.find(params[:id])
    end
  end

  private

  def referer_params
  	params.require(:referer).permit(:url)
  end
end
