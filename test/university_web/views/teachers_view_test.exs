defmodule UniversityWeb.TeachersViewTest do
  use UniversityWeb.ConnCase, async: true
  import Phoenix.View

  alias University.{Teacher, Repo}

  describe "render('index.json')/2" do
    test "return a list with all teachers" do
      %{name: "Some Teacher", graduation: "MASTER"}
      |> Teacher.changeset
      |> Repo.insert

      teachers = Repo.all(Teacher)

      response = render(UniversityWeb.TeachersView, "index.json", %{teachers: teachers})
      %{teachers: serialized_teachers} = response

      assert serialized_teachers == teachers
    end
  end
end
