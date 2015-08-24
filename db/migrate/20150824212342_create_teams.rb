class CreateTeams < ActiveRecord::Migration
  def change
    create_table(:teams) do |t|
      t.column(:name, :string)
      t.column(:size, :integer)

      t.timestamps()
    end

    add_column(:players, :team_id, :integer)
  end
end
