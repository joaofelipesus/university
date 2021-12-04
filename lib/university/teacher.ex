defmodule University.Teacher do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :graduation]
  @derive {Jason.Encoder, only: [:id, :name, :graduation]}

  schema "teachers" do
    field :name, :string
    field :graduation, :string
    timestamps()
  end

  def changeset(enum \\ %__MODULE__{}, params) do
    enum
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_inclusion(:graduation, ["POST_GRADUATED", "MASTER", "DOCTOR", "POST_DOCTOR"])
  end
end
