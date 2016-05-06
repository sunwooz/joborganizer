class ApplicationStatusesController < ApplicationController

  def create
    application_status_or_nil = ApplicationStatus.find_by(name: params[:application_status][:name])
    application_status = !!application_status_or_nil ? application_status_or_nil : ApplicationStatus.new(strong_params)

    job_detail = current_user.job_details.find(params[:job_detail_id])
    job_detail.application_statuses << application_status
    binding.pry
    
    respond_to do |format|
      if job_detail.save
        format.js { render layout: false, action: "create_success" }
      else
        format.js { render layout: false, action: "create_failure" }
      end
    end
  end

  private

  def strong_params
    params.require(:application_status).permit(:name)
  end
end
