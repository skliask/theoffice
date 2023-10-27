class AddAuthToTenant < ActiveRecord::Migration[7.2]
  def change
    add_column :tenants, :email, :string, null: false
    add_column :tenants, :password_digest, :string, null: false
  end
end
