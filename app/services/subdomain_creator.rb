require_relative 'application_service'
require 'faraday'
require 'JSON'

class SubdomainCreator < ApplicationService

    def initialize
        @base_url = "https://api.heroku.com/apps"
        @headers = headers
    end

    def headers
        {
            "Accept" => "application/vnd.heroku+json; version=3",
            "Content-Type" => "application/json",
            "Authorization" => "Bearer 998aa496-ac7a-4b4a-bb35-7d45f74ca343",
        }
    end

    # reload the partner because if the auth fails, the token get renew
    def call
        data = payload
        verify_subdomain_list(data)
    end

    def verify_subdomain_list(data)
        # p data
    end

    def payload
        retries = 0
        conn = Faraday.get("#{@base_url}/equinox-admin/domains", { boom: 'zap'}, @headers)
        
        puts conn.body

        # begin
        # # raise AuthenticationError (si por alguna razon la authentication ha fallado)
        # rescue AuthenticationError
        #     if (retries += 1) <= 3
        #         retry
        #     end
        # rescue URI::InvalidURIError => exception
        #     Rollbar.error(exception)
        # rescue JSON::ParserError => exception
        #     Rollbar.error(exception)
        # rescue Faraday::ConnectionFailed
        #     if (retries += 1) <= 3
        #         sleep(retries * 3)
        #         retry
        #     end
        # end
    end
end

SubdomainCreator.new.call