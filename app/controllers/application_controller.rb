class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(*)
    fixtures_path
  end

  def after_sign_out_path_for(*)
    root_path
  end

  protected

  def authenticate_user!
    redirect_to root_path, notice: "You must login" unless user_signed_in?
  end
end
