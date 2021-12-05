defmodule University.Repo.Migrations.CreateTeachersTable do
  use Ecto.Migration

  def change do
    create table(:teachers) do
      add :name, :string
      add :graduation, :string

      timestamps()
    end
  end
end
