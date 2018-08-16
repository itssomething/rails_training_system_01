class StaticPagesController < ApplicationController
  before_action :login

  def home; end

  def subject; end

  def in_subject; end

  def report; end

  def login; end

  def profile; end

  def edit_profile; end
  private

  def login
    return if user_signed_in?
    flash[:danger] = t "please_login"
    redirect_to new_user_session_path
  end
end
