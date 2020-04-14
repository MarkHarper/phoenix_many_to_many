# A schema file for https://app.quickdatabasediagrams.com

## User

id PK int
name string

## Tag

name string PK

## Image

id int PK
url string
person_id int FK >- User.id

## Images_Tags

image_id int FK - Image.id
tag_id int FK - Tag.name
