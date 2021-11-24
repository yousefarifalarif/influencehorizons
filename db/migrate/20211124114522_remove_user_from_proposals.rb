class RemoveUserFromProposals < ActiveRecord::Migration[6.1]
  def change
    remove_reference :proposals, :user, null: false, foreign_key: true
  end
end
