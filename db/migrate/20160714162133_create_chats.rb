class CreateChats < ActiveRecord::Migration[5.0]
  def change
    unless table_exists? :chats
      create_table :chats do |t|
        t.string :user_name
        t.text :message
        t.timestamps
      end
    end
  end
end
