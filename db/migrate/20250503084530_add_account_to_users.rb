class AddAccountToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :account, :string, null: false
  end
end
