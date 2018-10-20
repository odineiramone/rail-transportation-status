module API
  module V1
    class StatusController < ApiController

      namespace '/api' do
        namespace '/v1' do
          get "/status" do
            json(
              situations: TransportSituation.check_situations.map(&:as_hash)
            )
          end
        end
      end
    end
  end
end
