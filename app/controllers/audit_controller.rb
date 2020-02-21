class AuditController < ApplicationController
  before_action :authenticate_auditor!

  def index; end
end
