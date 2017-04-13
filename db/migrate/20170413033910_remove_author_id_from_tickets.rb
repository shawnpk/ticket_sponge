class RemoveAuthorIdFromTickets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tickets, :author_id, :integer
  end
end
