class CreateDayPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :day_plans do |t|
      t.references :user, foreign_key: { primary_key: :google_id }, type: :string
      t.date :date
      t.string :meal_type
      t.string :google_id

      t.timestamps
    end
  end
end
