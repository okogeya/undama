class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string       :title
      t.text         :text,           null: false
      t.integer      :happy_level_id, null: false 
      t.integer      :public_id,      null: false  
      t.date         :day,            null: false 
      t.references   :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
