class DropVinyls < ActiveRecord::Migration[7.1]
  def change
    drop_table :vinyls
  end
end
