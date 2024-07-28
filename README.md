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
<!-- 変更途中 -->

 # hurimaテーブル設計 


## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |
### Association
- belong_to :item
- belong_to :buy


## item テーブル
| Column     | Type     | Options                       |
| ---------- | -------- | ----------------------------- |
| title      | string   | null: false                   |
| catch_copy | text     | null: false                   |
| concent    | text     | null: false                   |
| user       |references| null: false, foreign_key: true|
### Association
- has_many :user
- belong_to :buy

<!-- ここは編集済み -->
## buy テーブル
| Column      | Type       |       Options                  |
| ------------| ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| get_product | references | null: false, foreign_key: true   |
### Association
- has_many :user
- has_many :item
- has_one :b_information


## b_information テーブル
| Column    | Type       |       Options                  |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false,foreign_key: true   |
### Association
- belongs_to :buy