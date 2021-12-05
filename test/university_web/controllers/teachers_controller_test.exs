defmodule UniversityWeb.TeachersControllerTest do
  use UniversityWeb.ConnCase, async: true

  import University.Factory

  describe "index/2" do
    test "when there is no teachers", %{conn: conn} do
      response = conn
        |> get(Routes.teachers_path(conn, :index, %{}))
        |> json_response(:ok)

      assert response == %{"teachers" => []}
    end

    test "when there are teachers on database", %{conn: conn} do
      insert(:teacher)

      response = conn
        |> get(Routes.teachers_path(conn, :index, %{}))
        |> json_response(:ok)

      assert %{
        "teachers" => [
          %{
            "graduation" => "MASTER",
            "id" => _id,
            "name" => "José Aldo Jr."
          }
        ]
      } = response
    end
  end
end
