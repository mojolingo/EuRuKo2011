require 'adhearsion_api'

class CallsController < ApplicationController
  def create
    begin
      AdhearsionAPI.instance.originate params[:call][:participants].map(&:to_i)
      flash[:notice] = 'Call was successfully created.'
    rescue => e
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")
      flash[:error] = 'Failed to originate'
    ensure
      redirect_to contacts_path
    end
  end
end
