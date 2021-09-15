defmodule Gotcha.Arena do
  use Gotcha.Query

  schema "arenas" do
    field :city, :string
    field :latitude, :float
    field :location_name, :string
    field :longitude, :float
    field :state, :string
    field :street_address1, :string
    field :street_address2, :string
    field :zip_code, :string

    timestamps()
  end

  def near(latitude, longitude, radius) do
    radius_in_meters = Kernel.trunc(radius * 1609.34)
    current_location = [latitude, longitude]

    __MODULE__
    |> Repo.all()
    |> Enum.filter(fn arena ->
      Geocalc.within?(radius_in_meters, current_location, [arena.latitude, arena.longitude])
    end)
  end

  @doc false
  def changeset(arena, attrs) do
    arena
    |> cast(attrs, [
      :location_name,
      :street_address1,
      :street_address2,
      :city,
      :state,
      :zip_code,
      :latitude,
      :longitude
    ])
    |> validate_required([
      :location_name,
      :street_address1,
      :street_address2,
      :city,
      :state,
      :zip_code,
      :latitude,
      :longitude
    ])
  end
end
