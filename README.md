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
| nickname           | string  | null: false, unique: true|
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
| category_id   | intager    | null: false                   |
| status_id     | intager    | null: false                   |
| cost_id       | intager    | null: false                   |
| area_id       | intager    | null: false                   |
| need_day_id   | intager    | null: false                   |
| price         | intager    | null: false                   |
| user          | references | null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :buy


## buys テーブル
| Column       | Type       |       Options                  |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :b_information


## b_informations テーブル
| Column     | Type       |       Options                  |
| ---------- | ---------- | ------------------------------ |
| area_id    | intager    | null: false, foreign_key: true |
| location   | string     | null: false |
| address    | string     | null: false |
| building   | string     |             |
| phone      | string     | null: false |
| buy        | references | null: false, foreign_key: true|
### Association
- belongs_to :buy