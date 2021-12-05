defmodule University.Services.Teachers.Update do
  alias University.{Teacher, Repo}
  alias University.Services.Teachers.Find

  def call(id, params) do
    with {:ok, %Teacher{} = teacher} <- Find.by_id(id) do
      teacher
      |> Teacher.changeset(params)
      |> Repo.update()
    end
  end
end
