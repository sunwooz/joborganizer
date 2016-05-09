class JobDetailsController < ApplicationController
  def index
    @jobs = current_user.job_details

    respond_to do |format|
      format.js { render layout: false }
    end
  end
  
  def create
    @job_detail = current_user.job_details.new(jobkey: params[:jobkey], user_id: params[:user_id], company: params[:company], title: params[:title])

    respond_to do |format|
      if @job_detail.save
        format.js { render layout: false, action: "create_success" }
      else
        format.js { render layout: false, action: "create_failure" }
      end
    end
  end

  def update
    job_detail = current_user.job_details.find(params[:job_detail_id])

    respond_to do |format|
      if job_detail.update(strong_params)
        format.js { render layout: false, action: "update_success" }
      else
        format.js { render layout: false, action: "update_failure" }
      end
    end
  end

  private

  def strong_params
    params.require(:job_detail).permit(:jobkey, :user_id, :cover_letter, :note, :company, :title)
  end


end