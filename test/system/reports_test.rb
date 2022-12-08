# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:yuji_report)

    visit new_user_session_path
    fill_in 'Eメール', with: 'example@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'create a Report' do
    click_link '日報'
    visit reports_path
    click_link '新規作成'
    visit new_report_path
    fill_in 'タイトル', with: 'title'
    fill_in '内容', with: 'content'
    click_button '登録'
    assert_text '日報が作成されました。'
  end

  test 'updating a Report' do
    click_link '日報'
    visit reports_path
    click_link '編集'
    visit edit_report_path(@report)
    fill_in 'タイトル', with: '初めての日報'
    fill_in '内容', with: '楽しかったです。'
    click_button '更新する'
    assert_text '日報が更新されました。'
  end

  test 'destroying a Report' do
    click_link '日報'
    visit reports_path
    accept_confirm do
      click_link '削除'
    end
    assert_text '日報が削除されました。'
  end
end
