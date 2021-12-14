class CreateFulldetails < ActiveRecord::Migration[6.1]
  def change
    create_table :fulldetails do |t|
      t.string :name
      t.string :contact
      t.date :dob
      t.string :address
      t.string :country
      t.string :gender
      t.string :relationship
      t.string :hobbies
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
