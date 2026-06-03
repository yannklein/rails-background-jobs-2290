# frozen_string_literal: true

class RemoveModelIdFromChats < ActiveRecord::Migration[8.1]
  def change
    remove_column :chats, :model_id, :string
  end
end
