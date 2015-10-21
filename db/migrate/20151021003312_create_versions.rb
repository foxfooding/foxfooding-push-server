class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :version, :null => false

      t.timestamps
    end

    Version.create version: 1
  end
end
