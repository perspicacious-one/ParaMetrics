class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.references :registered_app

      t.timestamps
    end
  end
end
