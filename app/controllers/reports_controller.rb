# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit show]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      flash[:success] = '日報を投稿しました。'
      redirect_to reports_path
    else
      render :new
    end
  end

  def new
    @report = Report.new
  end

  def edit; end

  def show
    @comment = @report.comments
  end

  def update
    @report = Report.find(params[:id])
    return unless @report.update(report_params)

    flash[:success] = '日報の編集に成功しました。'
    redirect_to report_path(@report)
  end

  def destroy
    Report.find(params[:id]).destroy
    flash[:success] = '日報を削除しました。'
    redirect_to reports_path
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :text)
  end
end
