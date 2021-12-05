defmodule University.Factory do
  use ExMachina.Ecto, repo: University.Repo

  def teacher_factory do
    %University.Teacher{
      name: "José Aldo Jr.",
      graduation: "MASTER"
    }
  end
end
