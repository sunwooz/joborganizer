class JobsController < ApplicationController
  def search

    terms = {
      'q' => params[:query],
      'l' => params[:location]
    }

    #make an api call to indeed with the search query
    @jobs = IndeedAPI.search_jobs(terms)


    respond_to do |format|
      format.js { render layout: false }
    end

  end
end
