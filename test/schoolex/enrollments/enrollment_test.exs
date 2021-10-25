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
  end
end
