class CreateProjetos < ActiveRecord::Migration[5.1]
  def change
    create_table :projetos do |t|
      t.string :name
      t.text :description
      t.text :bug
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :projetos, [:user_id, :created_at]
  end
end
