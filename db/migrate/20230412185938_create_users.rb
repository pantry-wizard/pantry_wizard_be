class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :intolerances
      t.string :likes
      t.string :dislikes
      t.string :dietary_restrictions
      t.string :google_id

      t.timestamps
    end
  end
end
