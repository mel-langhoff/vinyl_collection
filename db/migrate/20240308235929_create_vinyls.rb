class CreateVinyls < ActiveRecord::Migration[7.1]
  def change
    create_table :vinyls do |t|
      t.string :first_name
      t.string :last_name
      t.string :album_title
      t.string :notes
      t.timestamps
    end
  end
end
