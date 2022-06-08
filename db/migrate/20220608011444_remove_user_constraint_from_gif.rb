class RemoveUserConstraintFromGif < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:gifs, :user_id, true)
  end
end
