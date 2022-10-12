# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    root_path(resource)
  end

  def after_sign_out_path_for(resource)
    login_path
  end
end
