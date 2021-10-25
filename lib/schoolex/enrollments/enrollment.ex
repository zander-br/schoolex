defmodule Schoolex.Enrollments.Enrollment do
  use Ecto.Schema

  import Ecto.Changeset

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
  end
end
