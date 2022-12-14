# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @yuji_report   = reports(:yuji_report)
    @megumi_report = reports(:megumi_report)
    @yuji   = users(:yuji)
    @megumi = users(:megumi)
  end

  test 'editable?' do
    assert @yuji_report.editable?(@yuji)
    assert_not @yuji_report.editable?(@megumi)
  end

  test 'created_on' do
    assert_equal 'Wed, 30 Nov 2022'.to_date, @yuji_report.created_on
  end
end
