defmodule UniversityWeb.FallbackController do
  use UniversityWeb, :controller

  alias UniversityWeb.ErrorView

  def call(conn, {:error, message}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("400.json", %{message: message})
  end

  def call(conn, nil) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render("404.json", %{message: "Record not found."})
  end
end
