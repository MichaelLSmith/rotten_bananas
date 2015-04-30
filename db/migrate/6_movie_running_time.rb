class MovieRunningTime < ActiveRecord::Migration
  def change
    change_table :movies do |t|
       t.remove :string
       t.column :running_time, :string
       t.column :release_year, :string
       end
     end
   end
