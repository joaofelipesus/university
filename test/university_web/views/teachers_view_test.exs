defmodule UniversityWeb.TeachersViewTest do
  use UniversityWeb.ConnCase, async: true
  import Phoenix.View
  import University.Factory


  alias University.{Teacher, Repo}

  describe "render('index.json')/2" do
    test "return a list with all teachers" do
      insert(:teacher)

      teachers = Repo.all(Teacher)

      response = render(UniversityWeb.TeachersView, "index.json", %{teachers: teachers})
      %{teachers: serialized_teachers} = response

      assert serialized_teachers == teachers
    end
  end

  describe "render('show.json', %{teacher: teacher})" do
    test "return a teacher serialized" do
      teacher = insert(:teacher)
      %{teacher: serialized_teacher} = render(UniversityWeb.TeachersView, "show.json", %{teacher: teacher})
      assert teacher == serialized_teacher
    end
  end
end
