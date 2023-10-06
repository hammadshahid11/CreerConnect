# frozen_string_literal: true

class CreateCompanyProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.string :contact_information
      t.text :bio
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
