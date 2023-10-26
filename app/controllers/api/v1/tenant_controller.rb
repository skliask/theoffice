class Api::V1::TenantsController < ApplicationController
  before_action :set_tenant, only: %i[show]

  def index
    @tenants = Tenant.all
    render json: TenantSerializer.new(@tenants).serializable_hash[:data]
  end

  def show
    render json: TenantSerializer.new(@tenant).serializable_hash[:data][:attributes]
  end

  private
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end
end
