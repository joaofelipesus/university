defmodule University.Services.Teachers.Create do
  alias University.{Repo, Teacher}

  def call(params) do
    params
    |> Teacher.changeset()
    |> Repo.insert()
  end
end
