class AddDogToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dog, :string null: false
  end
end
