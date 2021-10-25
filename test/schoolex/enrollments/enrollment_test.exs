defmodule Schoolex.Enrollments.EnrollmentTest do
  use Schoolex.DataCase, async: true

  import Schoolex.Factory

  alias Ecto.Changeset
  alias Schoolex.Enrollments.Enrollment

  describe "changeset/2" do
    test "when all attrs is valid, returns a valid changeset" do
      valid_attrs = build(:enrollment_attrs)

      valid_enrollment = Enrollment.changeset(valid_attrs)

      assert %Changeset{
               changes: %{student_id: "f62732cd-7b02-4594-8e64-d172299381a1"},
               valid?: true
             } = valid_enrollment
    end

    test "when invalid student_id, returns an invalid changeset" do
      invalid_attrs = build(:enrollment_attrs, %{student_id: "invalid_id"})

      invalid_enrollment = Enrollment.changeset(invalid_attrs)

      expected_invalid_response = %{student_id: ["invalid uuid"]}

      assert errors_on(invalid_enrollment) == expected_invalid_response
      assert %Changeset{valid?: false} = invalid_enrollment
    end
  end
end
