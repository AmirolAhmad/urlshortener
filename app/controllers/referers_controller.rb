class ReferersController < ApplicationController
  def index
  	@referers = Referer.all
    @referer ||= Referer.new
  end

  def create
  	@referer = Referer.new(referer_params)
    
    respond_to do |format|
    	if @referer.save
        flash[:notice] = "Link #{@referer.url} has been shorten to #{@referer.shorten_url}"
        format.html { redirect_to root_path }
        format.js { render inline: "location.reload();" }
    	else
        flash[:alert] = "URL must start with http:// or https://"
    		format.html { render 'new' }
        format.js { render inline: "location.reload();" }
    	end
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
