require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class UberDrivers < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'partner.accounts'
      option :name, :uber_drivers
      option :client_options, :site          => 'https://api.uber.com',
                              :authorize_url => 'https://login.uber.com/oauth/v2/authorize',
                              :token_url     => 'https://login.uber.com/oauth/v2/token'

      uid { raw_info['uuid'] }

      info do
        {
          :driver_id         => raw_info['driver_id'],
          :first_name        => raw_info['first_name'],
          :last_name         => raw_info['last_name'],
          :email             => raw_info['email'],
          :phone_number      => raw_info['phone_number'],
          :picture           => raw_info['picture'],
          :rating            => raw_info['rating'],
          :promo_code        => raw_info['promo_code'],
          :activation_status => raw_info['activation_status']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/partners/me').parsed || {}
      end

      def request_phase
        options[:authorize_params] = {
          :client_id     => options['client_id'],
          :response_type => 'code',
          :scopes        => (options['scope'] || DEFAULT_SCOPE)
        }

        super
      end
    end
  end
end
