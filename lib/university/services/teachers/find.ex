defmodule University.Services.Teachers.Find do
  alias University.{Teacher, Repo}

  def by_id(id) do
    teacher = Repo.get(Teacher, id)

    case teacher do
      nil -> nil
      _ -> teacher
    end
  end
end
