# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

|Column         |Type   |Options    |
|---------------|-------|-----------|
|nickname       |string |null:false |
|email          |string |unique:true|
|password       |string |null:false |
|family_name    |string |null:false |
|first_name     |string |null:false |
|kanafamily_name|string |null:false |
|kanafirst_name |string |null:false |
|birth_year     |integer|null:false |
|birth_month    |integer|null:false |
|birth_day      |integer|null:false |

### Association
 - has_many :items
 - has_many :purchases

 ## items テーブル

|Column     |Type   |Options                     |
|-----------|-------|----------------------------|
|title      |string |null:false                  |
|description|string |unique:true                 |
|price      |integer|null:false                  |
|category   |string |null:false                  |
|condition  |string |null:false                  |
|area       |string |null:false                  |
|fee        |integer|null:false                  |
|days       |integer|null:false                  |
|user_id    |integer|null:false, foreign_key:true|
|category_id|integer|null:false, foreign_key:true|

### Association
 - belongs_to :users
 - belongs_to :categories
 - has_many :images

 ## images テーブル

|Column |Type   |Options                     |
|-------|-------|----------------------------|
|image  |string |null:false                  |
|item_id|integer|null:false, foreign_key:true|

### Association
 - belongs_to :items

 ## categories テーブル

|Column |Type   |Options                     |
|-------|-------|----------------------------|
|image  |string |null:false                  |
|item_id|integer|null:false, foreign_key:true|

### Association
 - has_many :items

  ## purchases テーブル

|Column |Type   |Options                     |
|-------|-------|----------------------------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|

### Association
 - belongs_to :users
 - has_one: addresses

  ## addresses テーブル

|Column     |Type   |Options                     |
|-----------|-------|----------------------------|
|postal_code|string |null:false                  |
|prefecture |string |null:false                  |
|city       |integer|null:false                  |
|block_num  |string |null:false                  |
|phone_num  |string |null:false                  |
|purchase_id|integer|null:false, foreign_key:true|

### Association
 - belongs_to: purchases