class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.integer :user_id
      t.integer :song_room_id
      t.string :accepted_or_not

      t.timestamps
    end
  end
end
