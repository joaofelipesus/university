defmodule UniversityWeb.TeachersController do
  use UniversityWeb, :controller

  alias University.{Repo, Teacher}
  alias University.Services.Teachers.Find

  action_fallback UniversityWeb.FallbackController

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", %{teachers: Repo.all(Teacher)})
  end

  def show(conn, %{"id" => id}) do
    with {:ok, teacher: %Teacher{} = teacher} <- Find.by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", %{teacher: teacher})
    end
  end
end
