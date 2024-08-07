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

 # hurimaテーブル設計 


## users テーブル
| Column             | Type    | Options     |
| ------------------ | --------| ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- has_many :buys


## items テーブル
| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| product       | string     | null: false                   |
| explanation   | text       | null: false                   |
| category_id   | integer    | null: false                   |
| status_id     | integer    | null: false                   |
| cost_id       | integer    | null: false                   |
| area_id       | integer    | null: false                   |
| need_day_id   | integer    | null: false                   |
| price         | integer    | null: false                   |
| user          | references | null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :buy


## orders テーブル
| Column       | Type       |       Options                  |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :b_information


## informations テーブル
| Column     | Type       |       Options                  |
| ---------- | ---------- | ------------------------------ |
| postal     | string     | null: false|
| area_id    | integer    | null: false, foreign_key: true |
| location   | string     | null: false |
| address    | string     | null: false |
| building   | string     |             |
| phone      | string     | null: false |
| buy        | references | null: false, foreign_key: true|
### Association
- belongs_to :buy
