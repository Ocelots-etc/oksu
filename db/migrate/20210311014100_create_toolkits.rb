class CreateToolkits < ActiveRecord::Migration[6.1]
  def change
    create_table :toolkits do |t|
      t.string :legal
      t.string :documents
      t.string :job
      t.string :housing
      t.string :financial
      t.string :childcare
      t.string :health
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
