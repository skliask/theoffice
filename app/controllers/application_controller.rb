require 'pagy/extras/headers'

class ApplicationController < ActionController::API
  include Pagy::Backend
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

    def current_tenant
      @current_tenant ||= Tenant.find(payload['tenant_id'])
    end

    def not_authorized
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
end
