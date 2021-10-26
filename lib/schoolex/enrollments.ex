defmodule Schoolex.Enrollments do
  alias Ecto.Changeset
  alias Schoolex.Enrollments.{Enrollment, Student}
  alias Schoolex.Repo

  def create_enrollment(enrollment) do
    enrollment
    |> insert_student()
    |> insert_enrollment()
  end

  defp insert_student(%{student: student} = enrollment) do
    student
    |> Student.changeset()
    |> Repo.insert()
    |> handle_student(enrollment)
  end

  defp insert_enrollment({:ok, enrollment}) do
    enrollment
    |> Enrollment.changeset()
    |> Repo.insert()
  end

  defp insert_enrollment({:error, reason}), do: {:error, reason}

  defp handle_student({:ok, %Student{id: student_id}}, enrollment) do
    change_enrollment =
      enrollment
      |> Map.delete(:student)
      |> Map.put(:student_id, student_id)

    {:ok, change_enrollment}
  end

  defp handle_student({:error, %Changeset{}} = error, _enrollment), do: error
end
