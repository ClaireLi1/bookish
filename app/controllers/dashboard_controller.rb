class DashboardController < ApplicationController
  def index
    @borrowed_copies = current_user.borrowed_copies.includes(:book)
  end
end
