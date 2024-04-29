class CreateRecipients < ActiveRecord::Migration[7.1]
  def change
    create_table :recipients do |t|
      t.belongs_to :user, index: true
      t.belongs_to :message, index: true
      t.timestamps
    end
  end
end