class DropPosts < ActiveRecord::Migration[6.0]
    def up
      drop_table :posts
    end
  
    def down
      fail ActiveRecord::IrreversibleMigration[6.0]
    end
end
