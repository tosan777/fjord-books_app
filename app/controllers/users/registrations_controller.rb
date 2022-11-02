# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create; end

  def update; end

  protected

  # sign_up時のストロングパラメータ
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password])
  end

  # deviseのupdate時のストロングパラメータ
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email password post_code address self_introduction])
  end

  # 現在のパスワードを入力しなくてもアカウント情報を更新できるようにする
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  # アップデート後のリダイレクト先
  def after_update_path_for(_resource)
    user_path(resource)
  end
end
