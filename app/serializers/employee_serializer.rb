class EmployeeSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :role, :tenant_id, :email
end
