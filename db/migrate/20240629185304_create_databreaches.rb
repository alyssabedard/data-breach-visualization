class CreateDatabreaches < ActiveRecord::Migration[7.1]
  def change
    create_table :databreaches do |t|
      t.string :organisation
      t.string :alternative_name
      t.integer :records_lost
      t.integer :year
      t.date :date
      t.text :story
      t.string :sector
      t.string :method
      t.boolean :has_interesting_story
      t.integer :data_sensitivity
      t.string :displayed_records
      t.text :source_name
      t.text :first_source_link
      t.text :second_source_link
      t.integer :data_id

      t.timestamps
    end
  end
end
