class HomesController < ApplicationController
  before_action :authenticate_user!, expect: [:top, :about]
  def top
  end

  def about
  end
end