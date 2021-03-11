class CreateToolkits < ActiveRecord::Migration[6.1]
  def change
    create_table :toolkits do |t|
      t.boolean :legal
      t.boolean :documents
      t.boolean :job
      t.boolean :housing
      t.boolean :financial
      t.boolean :childcare
      t.boolean :health
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
