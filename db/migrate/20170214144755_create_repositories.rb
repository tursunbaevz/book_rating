class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.references :book, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
