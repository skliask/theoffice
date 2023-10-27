# == Schema Information
#
# Table name: tenants
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class TenantSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email
end
