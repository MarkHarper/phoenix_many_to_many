# ManyToMany

A Phoenix Tutorial on Many to Many Relationships with Postgres

Steps:

- run "mix phx.new many_to_many"
- run "mix phx.gen.html Images Image images url:string"
- run "mix phx.gen.html Tags Tag tags name:string"
- add many_to_many images to tags
- add many_to_many tags to images
- run "mix ecto.gen.migration images_tags"
- update images_tags migration
- run "mix ecto.migrate"
- run "docker-compose up -d" from within the ./deploy/dev folder
- add two tags
- add two images
- preload tags for images
- preload images for tags
- update image template to display image elements
- update image template to display tags
- update tag template to display images
- update form to add/remove tags for images
