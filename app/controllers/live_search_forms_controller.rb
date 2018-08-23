class LiveSearchFormsController < ApplicationController
  def create
    @q = User.where("name LIKE ?", "%#{params[:q]}%")
    r = render_to_string(partial: "user_courses/users_response", locals: {users: @q})
    render json: {html: r}
  end
end
