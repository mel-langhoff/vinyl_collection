class CreateVinyls < ActiveRecord::Migration[7.1]
  def change
    create_table :vinyls do |t|
      t.string :name
      t.string :album_title
      t.string :notes

      t.timestamps
    end
  end
end
