class AddForiegnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :backlogs, :references
  end
end
