class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.text :street1
      t.text :street2
      t.text :city
      t.integer :postal_code
      t.text :state
      t.text :country
      t.text :manager_name
      t.text :phone_number
      t.text :contact_hours

      t.timestamps
    end
  end
end
