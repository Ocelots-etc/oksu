class AddIudToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :uid, :numeric
  end
end
