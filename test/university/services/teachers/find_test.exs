defmodule University.Services.Teachers.FindTest do
  use University.DataCase, async: true

  alias University.Services.Teachers.Find
  alias University.Teacher

  import University.Factory

  describe "by_id/1" do
    test "when received id matches with a teacher" do
      teacher = insert(:teacher)

      assert %Teacher{} = teacher_found = Find.by_id(teacher.id)

      assert teacher_found == teacher
    end

    test "when received id doesn't match with any teacher" do
      uuid = "8e989dd9-e4ed-42a8-93d9-ab8d49c17239"
      response = Find.by_id(uuid)

      assert response == nil
    end
  end
end
