class RemoveIdsFromMovies < ActiveRecord::Migration
    def change
        change_table :movies do |t|
            t.remove :user_id
            t.remove :reviews_id
            t.rename :leadactor, :lead_actor
        end
        change_table :reviews do |r|
          r.rename :review_text, :text
          r.remove :rating_number_value
        end

    end
end