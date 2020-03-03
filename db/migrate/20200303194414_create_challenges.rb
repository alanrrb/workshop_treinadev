class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.integer :points

      t.timestamps
    end
  end
end
