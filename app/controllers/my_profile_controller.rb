# frozen_string_literal: true

class MyProfileController < ApplicationController
  def show
    @user = current_user
  end
end
