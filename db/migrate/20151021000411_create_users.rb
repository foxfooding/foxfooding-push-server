class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uuid, :null => false
      t.string :endpoint, :null => false

      t.timestamps
    end
  end
end
