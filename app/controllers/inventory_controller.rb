class InventoryController < ApplicationController
  before_action :authenticate_inventory!

  def index; end
end
