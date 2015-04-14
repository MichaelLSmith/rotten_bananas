class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :movies do |t|
      # Your code goes here
      t.string :director
      t.string :leadactor
      t.string :supporting_actor
      t.string :genre 
      t.date :release_date
      t.string :title
      t.text :poster_image_url
      t.time :running_time

      t.timestamps
    end

    create_table :reviews do |t|
      t.integer :rating
      t.text :review_text
      t.text :movie_summary
      t.float :rating_number_value
    end



  end

end