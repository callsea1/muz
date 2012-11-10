class ChangeCollaboratosAcceptedOrNot < ActiveRecord::Migration

  def up
	remove_column :collaborators, :accepted_or_not
	add_column	  :collaborators, :accepted, :boolean
  end

  def down
	add_column	  :collaborators, :accepted_or_not, :string
	remove_column :collaborators, :accepted
  end
end
