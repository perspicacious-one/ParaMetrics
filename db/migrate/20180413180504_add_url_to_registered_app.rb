class AddUrlToRegisteredApp < ActiveRecord::Migration[5.1]
  def change
    add_column :registered_apps, :url, :string
  end
end
