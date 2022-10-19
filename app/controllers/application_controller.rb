# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    users_myprofile_path
  end

  def after_sign_out_path_for(resource)
    users_login_path
  end
end
