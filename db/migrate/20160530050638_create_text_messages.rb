class CreateTextMessages < ActiveRecord::Migration
  def change
    create_table :text_messages do |t|
      t.string :number
      t.string :body

      t.timestamps null: false
    end
  end
end
