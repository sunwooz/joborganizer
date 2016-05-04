class AuthenticationsController < ApplicationController

  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]

    if current_user.authentications.pluck(:provider).include?(auth["provider"]) && current_user.authentications.pluck(:uid).include?(auth["uid"])  
      current_user.authentications.find_by_provider_and_uid(auth["provider"], auth["uid"])
    else
      current_user.authentications.create(provider: auth["provider"], uid: auth["uid"])
    end
    flash[:notice] = "Authentication successful."
    redirect_to authentications_url
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
