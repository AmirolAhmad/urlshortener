class CreateReferers < ActiveRecord::Migration
  def change
    create_table :referers do |t|
      t.string :url
      t.integer :click, default: 0
      t.string :slug

      t.timestamps null: false
    end
  end
end
