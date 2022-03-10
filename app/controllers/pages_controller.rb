class PagesController < ApplicationController
  def home
  	@messages = Message.order('created_at DESC')
  	@message = Message.new

  	respond_to do |format|
	    format.html
	    format.js
	end
  end
end
