class AddGuestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user, :boolean, default: false
  end
end
