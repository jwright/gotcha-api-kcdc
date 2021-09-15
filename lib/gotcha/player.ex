defmodule Gotcha.Player do
  use Gotcha.Query, module: __MODULE__

  schema "players" do
    field :avatar, :string
    field :email_address, :string
    field :name, :string
    field(:password, :string, virtual: true)
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:avatar, :name, :email_address, :password_hash])
    |> validate_required([:name, :email_address, :password_hash])
  end
end
