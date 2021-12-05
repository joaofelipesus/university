defmodule UniversityWeb.ErrorViewTest do
  use UniversityWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(UniversityWeb.ErrorView, "404.json", []) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(UniversityWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end

  test "renders 400.json" do
    error_messages = ["Some error"]

    assert render(UniversityWeb.ErrorView, "400.json", %{messages: error_messages}) ==
             %{errors: ["Some error"]}
  end
end
