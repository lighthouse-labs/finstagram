class CreateBaseTables < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar_url
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :finstagram_posts do |t|
      t.references :user
      t.string :photo_url
      t.timestamps
    end

    create_table :comments do |t|
      t.references :user
      t.references :finstagram_post
      t.text :text
      t.timestamps
    end

    create_table :likes do |t|
      t.references :user
      t.references :finstagram_post
      t.timestamps
    end

  end

end