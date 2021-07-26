class CreatePeopleImports < ActiveRecord::Migration[6.1]
  def change
    create_table :people_imports do |t|

      t.timestamps
    end
  end
end
