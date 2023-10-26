# == Schema Information
#
# Table name: tenants
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tenant < ApplicationRecord
  has_many :employees, dependent: :destroy

  validates :name, presence: true
end
