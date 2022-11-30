# frozen_string_literal: true

require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit new_user_session_path
    fill_in 'Eメール', with: 'example@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'create a reprot' do
    visit new_report_path
    fill_in 'タイトル', with: 'title'
    fill_in '内容', with: 'content'
    click_button '登録'
  end
end
