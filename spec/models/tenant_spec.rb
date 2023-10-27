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
require 'rails_helper'

RSpec.describe Tenant, type: :model do
  it { should have_many(:employees) }
  it { should validate_presence_of(:name) }
end
