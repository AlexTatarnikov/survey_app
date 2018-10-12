class AddRelationBetweenUsersAndResponses < ActiveRecord::Migration[5.2]
  def change
    add_reference :responses, :user, foreign_key: true, index: true, null: false

    add_index :responses, [:survey_id, :user_id], unique: true
  end
end
