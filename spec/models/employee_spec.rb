# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  role       :integer          default(0), not null
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
require 'rails_helper'

RSpec.describe Employee, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
