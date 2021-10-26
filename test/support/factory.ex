defmodule Schoolex.Factory do
  use ExMachina.Ecto, repo: Schoolex.Repo

  alias Schoolex.Enrollments.Student

  def student_attrs_factory do
    %{
      name: "Ana Silva",
      cpf: "832.081.519-34"
    }
  end

  def student_factory do
    %Student{
      name: "Ana Silva",
      cpf: "832.081.519-34",
      id: "f62732cd-7b02-4594-8e64-d172299381a1"
    }
  end

  def enrollment_attrs_factory do
    %{
      student_id: "f62732cd-7b02-4594-8e64-d172299381a1"
    }
  end

  def enrollment_parms_factory do
    %{
      student: build(:student_attrs)
    }
  end
end
