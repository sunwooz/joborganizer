class CoverLettersController < ApplicationController

  def create
    cover_letter = CoverLetter.new(job_id: params[:job_id], letter: params[:cover_letter][:letter])
    if cover_letter.save
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
    cover_letter = CoverLetter.find_by(job_id: params[:job_id])
    if cover_letter.update_attributes(strong_params)
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
      params.require(:cover_letter).permit(:letter)
    end

end
