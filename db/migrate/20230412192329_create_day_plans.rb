class CreateDayPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :day_plans do |t|
      t.references :user, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
