class JobsController < ApplicationController
  def search
    #make an api call to indeed with the search query
    @jobs = IndeedAPI.search_jobs(q: params[:q])
    # jobs.results.each { |j| j.job_title }

  end
end
