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
class Employee < ApplicationRecord
  enum :role, { marketing: 0, tech: 1, sales: 2, operations: 3 }

  belongs_to :tenant

  validates :name, :email, :role, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :role, inclusion: { in: Employee.roles.keys }

  scope :find_by_email, -> (email) { where email: email }
  scope :filter_by_role, -> (role) { where role: role }
  scope :find_by_name, -> (name) { where("name ILIKE ?", "%#{ name }%") }
end
