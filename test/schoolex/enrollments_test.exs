defmodule Schoolex.EnrollmentsTest do
  use Schoolex.DataCase, async: true

  import Schoolex.Factory

  alias Schoolex.Enrollments
  alias Schoolex.Enrollments.{Enrollment, Student}
  alias Schoolex.Repo

  describe "create_enrollment/1" do
    test "when all params is valid, returns the enrollment" do
      enrollment_params = build(:enrollment_parms)

      enrollment = Enrollments.create_enrollment(enrollment_params)

      %Student{id: student_id} =
        Repo.one(from s in Student, order_by: [desc: s.inserted_at], limit: 1)

      assert {:ok, %Enrollment{id: _id, student_id: ^student_id}} = enrollment
    end
  end
end
