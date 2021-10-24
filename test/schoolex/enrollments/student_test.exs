defmodule Schoolex.Enrollments.StudentTest do
  use Schoolex.DataCase, async: true

  import Schoolex.Factory

  alias Ecto.Changeset
  alias Schoolex.Enrollments.Student

  describe "changeset/2" do
    test "when all attrs is valid, retuns a valid changeset" do
      valid_attrs = build(:student_attrs)

      valid_student = Student.changeset(valid_attrs)

      assert %Changeset{
               changes: %{name: "Ana Silva", cpf: "832.081.519-34"},
               valid?: true
             } = valid_student
    end

    test "when invalid name, returns an invalid changeset" do
      invalid_attrs = build(:student_attrs, %{name: "Ana"})

      invalid_student = Student.changeset(invalid_attrs)

      expected_invalid_response = %{name: ["invalid student name"]}

      assert errors_on(invalid_student) == expected_invalid_response
      assert %Changeset{valid?: false} = invalid_student
    end

    test "when invalid CPF, returns an invalid changeset" do
      invalid_attrs = build(:student_attrs, %{cpf: "123.456.789-99"})

      invalid_student = Student.changeset(invalid_attrs)

      expected_invalid_response = %{cpf: ["invalid student CPF"]}

      assert errors_on(invalid_student) === expected_invalid_response
      assert %Changeset{valid?: false} = invalid_student
    end
  end
end
