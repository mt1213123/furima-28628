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

|Column            |Type   |Options                |
|------------------|-------|-----------------------|
|nickname          |string |null:false             |
|email             |string |null:false, unique:true|
|encrypted_password|string |null:false             |
|family_name       |string |null:false             |
|first_name        |string |null:false             |
|kanafamily_name   |string |null:false             |
|kanafirst_name    |string |null:false             |
|birth_day         |date   |null:false             |

### Association
 - has_many :items
 - has_many :purchases

 ## items テーブル

|Column       |Type      |Options                     |
|-------------|----------|----------------------------|
|title        |string    |null:false                  |
|description  |text      |null:false                  |
|price        |integer   |null:false                  |
|category_id  |integer   |null:false                  |
|condition_id |integer   |null:false                  |
|prefecture_id|integer   |null:false                  |
|fee_id       |integer   |null:false                  |
|days_id      |integer   |null:false                  |
|user         |references|null:false, foreign_key:true|


### Association
 - belongs_to :user
 - has_one : purchase

  ## purchases テーブル

|Column|Type      |Options                     |
|------|----------|----------------------------|
|user  |references|null:false, foreign_key:true|
|item  |references|null:false, foreign_key:true|

### Association
 - belongs_to :user
 - has_one: address
 - belongs_to :item

  ## addresses テーブル

|Column       |Type      |Options                     |
|-------------|----------|----------------------------|
|postal_code  |string    |null:false                  |
|prefecture_id|integer   |null:false                  |
|city         |string    |null:false                  |
|block_num    |string    |null:false                  |
|building     |string    |                            |
|phone_num    |string    |null:false                  |
|purchase     |references|null:false, foreign_key:true|

### Association
 - belongs_to: purchase