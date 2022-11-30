# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @yuji = users(:yuji)
    @megumi = users(:megumi)
  end

  test 'name_or_email' do
    user = User.new(name: '', email: 'example@example.com')
    assert_equal 'example@example.com', user.name_or_email

    user.name = 'hogehoge'
    assert_equal 'hogehoge', user.name_or_email
  end

  test 'follow' do
    assert_not @yuji.following?(@megumi)
    @yuji.follow(@megumi)
    assert @yuji.following?(@megumi)
  end

  test 'unfollow' do
    @yuji.follow(@megumi)
    assert @yuji.following?(@megumi)
    @yuji.unfollow(@megumi)
    assert_not @yuji.following?(@megumi)
  end

  test 'followed_by?' do
    assert_not @megumi.followed_by?(@yuji)
    @yuji.follow(@megumi)
    assert @megumi.followed_by?(@yuji)
  end
end
