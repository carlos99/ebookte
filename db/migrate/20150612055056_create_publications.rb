class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.references :author, index: true
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :publications, :authors
    add_foreign_key :publications, :books
  end
end
