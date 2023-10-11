# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.bigint :sender_id
      t.bigint :receiver_id
      t.references :messageable, polymorphic: true, null: false
      t.references :job_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
