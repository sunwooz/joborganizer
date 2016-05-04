class JobDetailsController < ApplicationController

  def create
    job_detail = current_user.job_details.new(jobkey: params[:jobkey], user_id: params[:user_id])
    if job_detail.save
      respond_to do |format|
        format.js { render layout: false, action: "create_success" }
      end
    else
      respond_to do |format|
        format.js { render layout: false, action: "create_failure" }
      end
    end
  end

  def update
    job_detail = current_user.job_details.find(params[:job_detail_id])
    if job_detail.update(strong_params)
      respond_to do |format|
        format.js { render layout: false, action: "update_success" }
      end
    else
      respond_to do |format|
        format.js { render layout: false, action: "update_failure" }
      end
    end
  end

  private

  def strong_params
    params.require(:job_detail).permit(:jobkey, :user_id, :cover_letter)
  end


end