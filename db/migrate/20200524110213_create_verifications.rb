class CreateVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :verifications do |t|
      t.string :card_type
      t.string :card_num
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
