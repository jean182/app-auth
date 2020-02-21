class HrController < ApplicationController
  before_action :authenticate_human_resources!

  def index; end
end
