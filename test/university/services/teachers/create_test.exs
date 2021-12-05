defmodule University.Services.Teachers.CreateTest do
  use University.DataCase, async: true

  alias University.Services.Teachers.Create
  alias University.Teacher

  describe "call/1" do
    test "when data is ok" do
      params = %{name: "Asuka", graduation: "MASTER"}
      response = Create.call(params)
      assert {:ok, %Teacher{}} = response
    end

    test "when param has problems" do
      params = %{name: "", graduation: "SUPREME_MASTER"}
      response = Create.call(params)
      assert {:error, %Ecto.Changeset{} = changeset} = response
      %{errors: errors} = changeset

      assert errors == [
               graduation:
                 {"is invalid",
                  [
                    validation: :inclusion,
                    enum: ["POST_GRADUATED", "MASTER", "DOCTOR", "POST_DOCTOR"]
                  ]},
               name: {"can't be blank", [validation: :required]}
             ]
    end
  end
end
