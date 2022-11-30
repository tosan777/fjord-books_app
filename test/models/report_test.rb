# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @one = reports(:one)
    @two = reports(:two)
    @yuji = users(:yuji)
    @megumi = users(:megumi)
  end

  test 'editable?' do
    assert @one.user == @yuji
    assert_not @one.user == @megumi
  end

  test 'created_on' do
    assert @one.created_at.to_date
  end
end
