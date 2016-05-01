require 'indeed-ruby'

class JobsController < ApplicationController
  def search

    client = Indeed::Client.new('6354264415606633')

    terms = {
      q: params[:query],
      l: params[:location],
      userip: request.remote_ip,
      useragent: request.env['HTTP_USER_AGENT']
    }

    #make an api call to indeed with the search query
    @jobs = client.search(terms)


    respond_to do |format|
      format.js { render layout: false }
    end

  end
end
