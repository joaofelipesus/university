defmodule UniversityWeb.TeachersController do
  use UniversityWeb, :controller

  alias University.{Repo, Teacher}

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", %{teachers: Repo.all(Teacher)})
  end
end
