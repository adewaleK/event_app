class AddPlanToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :plan, :string
  end
end
