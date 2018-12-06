class CreateClauses < ActiveRecord::Migration[5.2]
  def change
    create_table :clauses do |t|
      t.string :title
      t.string :paragraph
      t.text :wording
      t.string :bloc
      t.string :proc_service

      t.timestamps
    end
  end
end
