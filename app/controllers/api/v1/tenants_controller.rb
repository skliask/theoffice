class Api::V1::TenantsController < Api::V1::BaseController
  def show
    render json: TenantSerializer.new(current_tenant).serializable_hash[:data][:attributes]
  end
end
