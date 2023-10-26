class TenantSerializer
  include JSONAPI::Serializer
  attributes :id, :name
end
