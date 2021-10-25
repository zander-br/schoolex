defmodule Schoolex.Repo.Migrations.CreateEnrollmentsTable do
  use Ecto.Migration

  def change do
    create table(:enrollments) do
      add :student_id, references(:students)

      timestamps()
    end

    create unique_index(:enrollments, [:student_id])
  end
end
