defmodule University.Services.Teachers.UpdateTest do
  use University.DataCase, async: true

  alias University.Services.Teachers.Update

  import University.Factory

  describe "call/2" do
    test "when id doesnt belong to a teacher" do
      id = "eb9e10a0-55bd-11ec-bf63-0242ac130002"

      response = Update.call(id, %{name: "Some name", graduation: "MASTER"})
      assert response == nil
    end

    test "when params are valid" do
      teacher = insert(:teacher)

      response = Update.call(teacher.id, %{name: "New name", graduation: "DOCTOR"})
      assert {:ok,
      %University.Teacher{
        graduation: "DOCTOR",
        id: _id,
        name: "New name"
      }} = response
    end

    test "when params has problems" do
      teacher = insert(:teacher)

      response = Update.call(teacher.id, %{name: "New name", graduation: "MASTER_DOCTOR"})
      assert {:error,
      %Ecto.Changeset{
        errors: [
          graduation: {"is invalid",
           [
             validation: :inclusion,
             enum: ["POST_GRADUATED", "MASTER", "DOCTOR", "POST_DOCTOR"]
           ]}
        ],
        valid?: false
      }} = response
    end
  end
end
