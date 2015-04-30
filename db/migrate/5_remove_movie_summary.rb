class RemoveMovieSummary < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
    t.remove :movie_summary
      end
    end
  end