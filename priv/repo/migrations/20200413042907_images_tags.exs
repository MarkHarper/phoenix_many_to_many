defmodule ManyToMany.Repo.Migrations.ImagesTags do
  use Ecto.Migration

  def change do
    create table(:images_tags) do
      add :image_id, references(:images)
      add :tag_id, references(:tags)
    end

    create index(:images_tags, :image_id)
    create index(:images_tags, :tag_id)
    create unique_index(:images_tags, [:image_id, :tag_id])
  end
end
