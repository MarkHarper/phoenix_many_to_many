defmodule ManyToMany.Tags do
  @moduledoc """
  The Tags context.
  """

  import Ecto.Query, warn: false
  alias ManyToMany.Repo

  alias ManyToMany.Tags.Tag
  alias ManyToMany.Images

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id) do
    Repo.get!(Tag, id)
    |> Repo.preload(:images)
  end

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    images = Images.set_images(attrs["images"])

    %Tag{}
    |> Tag.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:images, images)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    images = Images.set_images(attrs["images"])

    tag
    |> Tag.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:images, images)
    |> Repo.update()
  end

  @doc """
  Deletes a tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{source: %Tag{}}

  """
  def change_tag(%Tag{} = tag) do
    Tag.changeset(tag, %{})
  end

  def set_tags(tags) do
    (tags || [])
    |> Enum.map(fn id -> get_tag(id) end)
  end

  defp get_tag(id) do
    Repo.get_by(Tag, id: id)
  end
end
