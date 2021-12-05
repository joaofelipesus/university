defmodule University.TeacherTest do
  use University.DataCase, async: true

  alias University.Teacher

  describe "changeset/2" do
    test "when params are ok" do
      params = %{name: "Asuka", graduation: "MASTER"}
      response = Teacher.changeset(params)
      %Ecto.Changeset{changes: changes, valid?: valid} = response
      assert valid == true
      assert changes == params
    end

    test "when missing required params" do
      params = %{name: nil, graduation: "MASTER"}
      response = Teacher.changeset(params)
      %Ecto.Changeset{errors: errors, valid?: valid} = response
      assert valid == false
      assert [name: {"can't be blank", [validation: :required]}] == errors
    end

    test "when graduation doesnt match with any valid" do
      params = %{name: "Steven", graduation: "DOCTOR_STRANGE"}
      response = Teacher.changeset(params)
      %Ecto.Changeset{errors: errors, valid?: valid} = response
      assert valid == false

      assert [
               graduation:
                 {"is invalid",
                  [
                    validation: :inclusion,
                    enum: ["POST_GRADUATED", "MASTER", "DOCTOR", "POST_DOCTOR"]
                  ]}
             ] == errors
    end
  end
end
