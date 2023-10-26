class Api::V1::TenantsController < ApplicationController
  before_action :set_tenant, only: %i[show]

  def index
    pagy, records = pagy(Tenant.all)
    pagy_headers_merge(pagy)
    render json: TenantSerializer.new(records).serializable_hash[:data]
  end

  def show
    render json: TenantSerializer.new(@tenant).serializable_hash[:data][:attributes]
  end

  private
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end
end
