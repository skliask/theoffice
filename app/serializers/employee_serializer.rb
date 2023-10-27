# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  role       :integer          default("marketing"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint           not null
#
# Indexes
#
#  index_employees_on_tenant_id  (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (tenant_id => tenants.id)
#
class EmployeeSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :role, :tenant_id
end
