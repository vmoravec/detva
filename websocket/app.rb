require "tubesock"

class WebsocketServer < Sinatra::Base
  include Tubesock::Hijack

  helpers do
    def hijack
      not_found unless env["HTTP_UPGRADE"] == "websocket"

      sock = Tubesock.hijack(env)
      yield sock
      sock.listen
      [ 200, {}, [] ]
    end
  end

  get "/ws" do
    hijack do |ws|
      ws.onopen do
        ws.send_data "Hello friend"
      end

      ws.onmessage do |data|
        ws.send_data(message: "You said #{data}")
      end
    end
    [ 200, {}, [] ]
  end
end
