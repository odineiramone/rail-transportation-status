require './config/environment'

module API
  module V1
    class ApiController < Sinatra::Base
      register Sinatra::Namespace
    end
  end
end
