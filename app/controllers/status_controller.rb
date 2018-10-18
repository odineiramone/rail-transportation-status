class StatusController < ApplicationController

  # GET: /status
  get "/status" do
    @status = TransportSituation.status
    erb :"/status/index.html"
  end
end
