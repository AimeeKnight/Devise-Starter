# This migration comes from blorgh (originally 20140607223441)
class AddImageToBlorghPosts < ActiveRecord::Migration
  def change
    add_column :blorgh_posts, :image, :string
  end
end
