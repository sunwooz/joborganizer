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

  def create
    job = Job.new(user_id: current_user.id, jobkey: params[:jobkey])
    if job.save
      respond_to do |format|
        format.js { render layout: false }
      end
    else
      redirect_to root_url
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
    @job = @client.jobs(criteria)

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

    def initialize_indeed_client
      @client = Indeed::Client.new('6354264415606633')
    end
end
