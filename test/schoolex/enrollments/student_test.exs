defmodule Schoolex.Enrollments.StudentTest do
  use Schoolex.DataCase, async: true

  alias Ecto.Changeset
  alias Schoolex.Enrollments.Student

  describe "changeset/2" do
    test "should not enroll without valid student name" do
      attrs = %{name: "Ana"}

      response = Student.changeset(attrs)

      expected_response = %{name: ["invalid student name"]}

      assert errors_on(response) == expected_response
      assert %Changeset{valid?: false} = response
    end
  end
end
