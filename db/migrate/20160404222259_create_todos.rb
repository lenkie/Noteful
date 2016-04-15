class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :body
      t.string :text
      t.belongs_to :user
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
