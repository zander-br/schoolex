defmodule Schoolex.Enrollments.Student do
  use Ecto.Schema

  import Brcpfcnpj.Changeset
  import Ecto.Changeset

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
