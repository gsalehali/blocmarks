class AddThumbnailAndTitleToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :thumbnail, :string
    add_column :bookmarks, :title, :string
  end
end
