# frozen_string_literal: true

require 'json_placeholder/errors/server_error'

module JsonPlaceholder
  class Request
    DOMAIN = Rails.application.credentials.jsonplaceholder.fetch(:api_url)
    RETRY_MAX = 5

    def get(resource)
      retry_count = 0
      endpoint = URI.join(DOMAIN, '/', resource)

      while retry_count <= RETRY_MAX
        response = HTTP.get(endpoint)
        status_code = response.code

        break if status_code >= 200 && status_code < 300

        sleep(1000)

        retry_count += 1
      end

      handle_response(response)
    end

    private

    def handle_response(response)
      raise JsonPlaceholder::Errors::ServerError, respoonse unless response.code < 400

      Oj.load(response.body, symbol_keys: true)
    end
  end
end
