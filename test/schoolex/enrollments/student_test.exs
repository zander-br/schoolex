defmodule Schoolex.Enrollments.StudentTest do
  use Schoolex.DataCase, async: true

  alias Ecto.Changeset
  alias Schoolex.Enrollments.Student

  describe "changeset/2" do
    test "should not enroll without valid student name" do
      attrs = %{name: "Ana", cpf: "832.081.519-34"}

      response = Student.changeset(attrs)

      expected_response = %{name: ["invalid student name"]}

      assert errors_on(response) == expected_response
      assert %Changeset{valid?: false} = response
    end

    test "should not enroll without valid student CPF" do
      invalid_attrs = %{name: "Ana Silva", cpf: "123.456.789-99"}
      valid_attrs = %{name: "Ana Silva", cpf: "832.081.519-34"}

      invalid_student = Student.changeset(invalid_attrs)
      valid_student = Student.changeset(valid_attrs)

      expected_invalid_response = %{cpf: ["invalid student CPF"]}

      assert errors_on(invalid_student) === expected_invalid_response
      assert %Changeset{valid?: false} = invalid_student

      assert %Changeset{changes: %{cpf: "832.081.519-34"}, valid?: true} = valid_student
      refute errors_on(valid_student) == expected_invalid_response
    end
  end
end
