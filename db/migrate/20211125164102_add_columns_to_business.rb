class AddColumnsToBusiness < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :company_url, :string
    add_column :businesses, :industry, :string
  end
end
