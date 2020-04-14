defmodule ManyToMany.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :url, :string
    many_to_many :tags, ManyToMany.Tags.Tag, join_through: "images_tags"

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
