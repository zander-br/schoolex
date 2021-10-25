defmodule Schoolex.Enrollments.Student do
  use Ecto.Schema

  import Brcpfcnpj.Changeset
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "students" do
    field :name, :string
    field :cpf, :string

    timestamps()
  end

  def changeset(student \\ %__MODULE__{}, attrs) do
    student
    |> cast(attrs, [:name, :cpf])
    |> validate_name()
    |> validate_cpf()
    |> unique_constraint([:cpf], message: "enrollment with duplicated student is not allowed")
  end

  defp validate_name(changeset) do
    changeset
    |> validate_required([:name])
    |> validate_format(:name, ~r/^([A-Za-z]+ )+([A-Za-z])+$/, message: "invalid student name")
  end

  defp validate_cpf(changeset) do
    changeset
    |> validate_required([:cpf])
    |> validate_cpf(:cpf, message: "invalid student CPF")
  end
end
