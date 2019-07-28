class AddPasswordDigestToAdminUsers < ActiveRecord::Migration[5.2]
  def up 
    remove_column "admin_users", "password"
    add_column "admin_users", "password_digest", :string
  end
end
