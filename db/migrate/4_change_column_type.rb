class ChangeColumnType < ActiveRecord::Migration
  
  def change
    rename_column :movies, :release_date, :string
    rename_column :movies, :running_time, :string
    add_column :movies, :summary, :text
  end

 

end