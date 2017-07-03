defmodule Dashboard.User do
  @moduledoc """
  User model.
  """
  use Dashboard.Web, :model

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id

  schema "users" do
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
  end

  def full_name(%Dashboard.User{first_name: first_name, last_name: last_name}) do
    first_name <> " " <> last_name
  end
end
