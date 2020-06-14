# frozen_string_literal: true

module JsonPlaceholder
  class Request
    DOMAIN = Rails.application.credentials.jsonplaceholder.fetch(:api_url)

    def get(resource)
      retry_max = 3
      retry_count = 0
      endpoint = URI.join(DOMAIN, '/', resource)

      while retry_count <= retry_max
        response = HTTP.get(endpoint)
        status_code = response.code

        break if status_code >= 200 && status_code < 300

        retry_count += 1
      end

      response
    end
  end
end
