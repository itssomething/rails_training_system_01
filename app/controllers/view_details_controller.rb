class ViewDetailsController < ApplicationController
  def show
    @report = UserReport.find_by id: params[:id]
    response = render_to_string partial: "user_reports/detail",
      locals: {report: @report}
    render json: {html: response}
  end
end
