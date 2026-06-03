class CreateHelpTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :help_tickets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.string :teacher_name
      t.string :status

      t.timestamps
    end
  end
end
