class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.belongs_to :user, index: true
      t.text :message
      t.timestamps
    end
  end
end

