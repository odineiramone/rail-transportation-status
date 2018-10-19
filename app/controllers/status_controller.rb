class StatusController < ApplicationController

  # GET: /status
  get "/status" do
    @status = TransportSituation.check_situations
    erb :"/status/index.html"
  end
end
