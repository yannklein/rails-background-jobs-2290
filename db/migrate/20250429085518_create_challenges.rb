# frozen_string_literal: true

class CreateChallenges < ActiveRecord::Migration[8.1]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :module
      t.text :content

      t.timestamps
    end
  end
end
