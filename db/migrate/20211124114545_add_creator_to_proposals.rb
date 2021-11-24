class AddCreatorToProposals < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :creator, :string
  end
end
