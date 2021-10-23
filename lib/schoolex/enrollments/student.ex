defmodule Schoolex.Enrollments.Student do
  use Ecto.Schema

  import Ecto.Changeset

  schema "students" do
    field :name, :string

    timestamps()
  end

  def changeset(student \\ %__MODULE__{}, attrs) do
    student
    |> cast(attrs, [:name])
    |> validate_name()
  end

  defp validate_name(changeset) do
    changeset
    |> validate_required([:name])
    |> validate_format(:name, ~r/^([A-Za-z]+ )+([A-Za-z])+$/, message: "invalid student name")
  end
end
