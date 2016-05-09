class PagesController < ApplicationController
  def home
    @jobs = current_user.job_details
  end
end
