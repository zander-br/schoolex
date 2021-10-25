defmodule Schoolex.Repo.Migrations.CreateStudentsTable do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :cpf, :string

      timestamps()
    end

    create unique_index(:students, [:cpf])
  end
end
