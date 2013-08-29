module Fog
  module Rackspace
    class Monitoring
      class Real

        def create_entity(options = {})
          data = options.dup
          request(
            :body     => JSON.encode(data),
            :expects  => [201],
            :method   => 'POST',
            :path     => 'entities'
          )
        end
      end

      class Mock

        def create_entity(options = {})
          
          if options[:label] == ""  
            raise Fog::Rackspace::Monitoring::BadRequest
          end

          response = Excon::Response.new
          response.status = 201
          response.body = ""
          response.headers = {
            "Date"                  => Time.now.utc.to_s,
            "Location"              => "https://monitoring.api.rackspacecloud.com/v1.0/55555/entities/foobarbaz",
            "X-Object-ID"           => "foobarbaz",
            "X-RateLimit-Limit"     => "50000",
            "X-RateLimit-Remaining" => "47877",
            "X-RateLimit-Window"    => "24 hours",
            "X-RateLimit-Type"      => "global",
            "X-Response-Id"         => "lakbngf9bgewkgb39sobnsv",
            "X-LB"                  => "dfw1-maas-prod-api1",
            "Content-Length"        => "0",
            "Content-Type"          => "text/plain"
          }
          response.remote_ip = "1.1.1.1"
          response
        end
      end
    end
  end
end

