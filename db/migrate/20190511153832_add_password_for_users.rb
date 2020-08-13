class AddPasswordForUsers < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        add_column :users, :password_digest, :string
      end

      dir.down do
        remove_column :users, :password_digest, :string
      end
    end
  end
end
