# frozen_string_literal: true

class AddSystemPromptToChallenges < ActiveRecord::Migration[8.1]
  def change
    add_column :challenges, :system_prompt, :text
  end
end
