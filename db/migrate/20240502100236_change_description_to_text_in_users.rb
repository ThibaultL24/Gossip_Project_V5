class ChangeDescriptionToTextInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :description, :text
  end
end
