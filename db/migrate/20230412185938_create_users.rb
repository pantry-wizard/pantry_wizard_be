class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false, primary_key: :google_id do |t|
      t.string :name
      t.string :email
      t.string :intolerances
      t.string :likes
      t.string :dislikes
      t.string :dietary_restrictions
      t.string :google_id, primary_key: true

      t.timestamps
    end
  end
end
