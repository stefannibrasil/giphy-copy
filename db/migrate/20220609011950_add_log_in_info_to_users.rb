class AddLogInInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :password_digest, :string
  end
end
