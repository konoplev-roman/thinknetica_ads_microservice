# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:ads) do
      primary_key :id
      Integer :user_id, null: false

      String :title, null: false
      String :description, text: true, null: false
      String :city, null: false
      Float :lat
      Float :lon
      Float :created_at
      Float :updated_at
    end
  end
end
