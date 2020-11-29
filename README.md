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
|encrypted_password|string |null:false |
|family_name    |string |null:false |
|first_name     |string |null:false |
|kanafamily_name|string |null:false |
|kanafirst_name |string |null:false |
|birth_day      |date   |null:false |

### Association
 - has_many :items
 - has_many :purchases

 ## items テーブル

|Column      |Type   |Options                     |
|------------|-------|----------------------------|
|title       |string |null:false                  |
|description |text   |null:false                  |
|price       |integer|null:false                  |
|category_id |integer|null:false                  |
|condition_id|integer|null:false                  |
|area_id     |integer|null:false                  |
|fee_id      |integer|null:false                  |
|days_id     |integer|null:false                  |
|user_id     |integer|null:false, foreign_key:true|


### Association
 - belongs_to :user
 - has_many :images

 ## images テーブル

|Column |Type   |Options                     |
|-------|-------|----------------------------|
|image  |string |null:false                  |
|item_id|integer|null:false, foreign_key:true|

### Association
 - belongs_to :item

  ## purchases テーブル

|Column |Type   |Options                     |
|-------|-------|----------------------------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|

### Association
 - belongs_to :user
 - has_one: addresses

  ## addresses テーブル

|Column     |Type   |Options                     |
|-----------|-------|----------------------------|
|postal_code|string |null:false                  |
|prefecture |string |null:false                  |
|city       |integer|null:false                  |
|block_num  |string |null:false                  |
|building   |string |null:false                  |
|phone_num  |string |null:false                  |
|purchase_id|integer|null:false, foreign_key:true|

### Association
 - belongs_to: purchase