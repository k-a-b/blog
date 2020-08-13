class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, index:{unique: true}
      t.string :email, index: {unique: true}
      t.boolean :moderator, dafault: false
      t.boolean :banned,    default: false

      t.timestamps
    end
  end
end
