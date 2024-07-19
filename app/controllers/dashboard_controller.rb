class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @borrowed_copies = current_user.borrowed_copies.includes(:book)
  end
end
