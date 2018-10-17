class StatusController < ApplicationController

  # GET: /status
  get "/status" do
    @status = RailTransports.check_status
    erb :"/status/index.html"
  end
end
