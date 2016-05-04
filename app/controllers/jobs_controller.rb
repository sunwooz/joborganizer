require 'indeed-ruby'

class JobsController < ApplicationController
  before_filter :initialize_indeed_client, only: [:search, :show]

  def search

    terms = {
      q: params[:query],
      l: params[:location],
      userip: request.remote_ip,
      useragent: request.env['HTTP_USER_AGENT'],
      start: 0
    }

    #make an api call to indeed with the search query
    @jobs = @client.search(terms)

    respond_to do |format|
      format.js { render layout: false }
    end

  end

  def index

    @jobs = current_user.jobs

    respond_to do |format|
      format.html
    end

  end

  def show

    criteria = {
      jobkeys: [ params[:id] ]
    }

    searched_job = @client.jobs(criteria)

    @job = searched_job["results"][0]
    @url = replace_protocal_with_blank(@job["url"])

    respond_to do |format|
      format.js { render layout: false }
    end

  end

  private

    def initialize_indeed_client
      @client = Indeed::Client.new('6354264415606633')
    end

    def replace_protocal_with_blank(url)
      if url.include?('https:')
        url = url.gsub("https:", "")
      else
        url = url.gsub("http:", "")
      end
      url
    end

end
