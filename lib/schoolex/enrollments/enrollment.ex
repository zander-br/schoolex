defmodule Schoolex.Enrollments.Enrollment do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.UUID
  alias Schoolex.Enrollments.Student

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "enrollments" do
    belongs_to :student, Student

    timestamps()
  end

  def changeset(enrollment \\ %__MODULE__{}, attrs) do
    enrollment
    |> cast(attrs, [:student_id])
    |> validate_user_id()
  end

  defp validate_user_id(changeset) do
    changeset
    |> validate_required(:student_id)
    |> validate_uuid(:student_id)
  end

  defp validate_uuid(changeset, field, options \\ []) when is_atom(field) do
    validate_change(changeset, field, fn _, student_id ->
      case UUID.cast(student_id) do
        :error -> [{field, options[:message] || "invalid uuid"}]
        {:ok, _uuid} -> []
      end
    end)
  end
end
