class EmployeeSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :role, :tenant_id
end
