class CreateSuscribes < ActiveRecord::Migration
  def change
    create_table :suscribes do |t|
      t.string :label
      t.string :link
      t.integer :countofrecords

      t.timestamps
    end
  end
end
