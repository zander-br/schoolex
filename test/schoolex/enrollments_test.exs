defmodule Schoolex.EnrollmentsTest do
  use Schoolex.DataCase, async: true

  import Schoolex.Factory

  alias Schoolex.Enrollments
  alias Schoolex.Enrollments.{Enrollment, Student}
  alias Schoolex.Repo

  describe "create_enrollment/1" do
    test "when all params is valid, returns the enrollment" do
      valid_params = build(:enrollment_parms)

      enrollment = Enrollments.create_enrollment(valid_params)

      %Student{id: student_id} =
        Repo.one(from s in Student, order_by: [desc: s.inserted_at], limit: 1)

      assert {:ok, %Enrollment{id: _id, student_id: ^student_id}} = enrollment
    end

    test "when there is invalid student, returns an error" do
      invalid_student = build(:student_attrs, %{name: "Ana"})
      invalid_params = build(:enrollment_parms, %{student: invalid_student})

      {:error, reason} = Enrollments.create_enrollment(invalid_params)

      expected_error_response = %{name: ["invalid student name"]}

      assert errors_on(reason) == expected_error_response
    end
  end
end
