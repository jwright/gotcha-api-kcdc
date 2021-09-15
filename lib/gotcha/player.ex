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
    |> hash_password
  end

  defp hash_password(%{changes: %{password: password}} = changeset) do
    put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
  end

  defp hash_password(%{changes: %{}} = changeset), do: changeset
end
