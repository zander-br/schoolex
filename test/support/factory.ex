defmodule Schoolex.Factory do
  use ExMachina.Ecto, repo: Schoolex.Repo

  def student_attrs_factory do
    %{
      name: "Ana Silva",
      cpf: "832.081.519-34"
    }
  end
end
