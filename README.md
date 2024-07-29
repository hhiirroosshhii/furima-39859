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
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | data    | null: false |
### Association
- has_many :items
- has_many :buys


## items テーブル
| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| product       | string     | null: false                   |
| explanation   | text       | null: false                   |
| category      | text       | null: false                   |
| status        | string     | null: false                   |
| price         | intager    | null: false                   |
| delivery_cost | string     | null: false                   |
| delivery_area | string     | null: false                   |
| delibery_days | string    | null: false                   |
| user          | references | null: false, foreign_key: true|
### Association
- belongs_to :users
- has_one :buys

## buys テーブル
| Column       | Type       |       Options                  |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
### Association
- belongs_to :users
- belongs_to :items
- has_one :b_informations


## b_informations テーブル
| Column     | Type       |       Options                  |
| ---------- | ---------- | ------------------------------ |
| postal     | string     | null: false |
| prefecture | string     | null: false |
| local      | string     | null: false |
| address    | string     | null: false |
| building   | string     |             |
| phone      | string     | null: false |
| item       | references | null: false,foreign_key: true, references: buys(id) |
### Association
- belongs_to :buys