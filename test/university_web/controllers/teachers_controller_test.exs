defmodule UniversityWeb.TeachersControllerTest do
  use UniversityWeb.ConnCase, async: true

  import University.Factory

  describe "index/2" do
    test "when there is no teachers", %{conn: conn} do
      response =
        conn
        |> get(Routes.teachers_path(conn, :index, %{}))
        |> json_response(:ok)

      assert response == %{"teachers" => []}
    end

    test "when there are teachers on database", %{conn: conn} do
      insert(:teacher)

      response =
        conn
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

  describe "show/2" do
    test "when received id matches with a record", %{conn: conn} do
      teacher = insert(:teacher)

      response =
        conn
        |> get(Routes.teachers_path(conn, :show, teacher.id))
        |> json_response(:ok)

      assert %{
               "teacher" => %{
                 "graduation" => "MASTER",
                 "id" => _id,
                 "name" => "José Aldo Jr."
               }
             } = response
    end

    test "when received id doesnt match with any teacher", %{conn: conn} do
      response =
        conn
        |> get(Routes.teachers_path(conn, :show, "eb9e10a0-55bd-11ec-bf63-0242ac130002"))
        |> json_response(:not_found)

      assert %{"errors" => "Record not found."} == response
    end
  end
end
