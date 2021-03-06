defmodule UniversityWeb.TeachersController do
  use UniversityWeb, :controller

  alias University.{Repo, Teacher}
  alias University.Services.Teachers.{Find, Create, Update}

  action_fallback UniversityWeb.FallbackController

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", %{teachers: Repo.all(Teacher)})
  end

  def show(conn, %{"id" => id}) do
    with %Teacher{} = teacher <- Find.by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", %{teacher: teacher})
    end
  end

  def create(conn, params) do
    with {:ok, %Teacher{} = teacher} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("show.json", %{teacher: teacher})
    end
  end

  def update(conn, %{"id" => id} = params) do
    with {:ok, %Teacher{} = teacher} <- Update.call(id, params) do
      conn
      |> put_status(:ok)
      |> render("show.json", %{teacher: teacher})
    end
  end
end
