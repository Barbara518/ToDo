class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :description, null: false
      t.date :due_date, null: false

      t.timestamps null: false
    end

    add_index :todos, :due_date
  end
end
