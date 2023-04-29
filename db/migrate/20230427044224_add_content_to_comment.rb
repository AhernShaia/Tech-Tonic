# frozen_string_literal: true

class AddContentToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :content, :text
  end
end