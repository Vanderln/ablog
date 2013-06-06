class CreateTagging < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :post
      t.references :tag
    end
  end
end
