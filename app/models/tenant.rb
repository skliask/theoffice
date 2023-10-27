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
class Tenant < ApplicationRecord
  has_secure_password

  has_many :employees, dependent: :destroy

  validates :name, presence: true
end
