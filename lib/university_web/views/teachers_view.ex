defmodule UniversityWeb.TeachersView do
  use UniversityWeb, :view

  def render("index.json", %{teachers: teachers}), do: %{teachers: teachers}

  def render("show.json", %{teacher: teacher}), do: %{teacher: teacher}
end
