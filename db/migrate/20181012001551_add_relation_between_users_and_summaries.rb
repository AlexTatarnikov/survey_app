class AddRelationBetweenUsersAndSummaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :summaries, :user, foreign_key: true, index: true, null: false

    add_index :summaries, [:survey_id, :user_id], unique: true
  end
end
