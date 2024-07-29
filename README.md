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
- has_many :item
- has_many :buy


## items テーブル
| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| product       | string     | null: false                   |
| explanation   | text       | null: false                   |
| genre_id      | text       | null: false                   |
| genre_id        | string     | null: false                   |
| genre_id  | intager    | null: false                   |
| genre_id | string    | null: false                   |
| genre_id | string     | null: false                   |
| genre_id | intager    | null: false                   |
| user          | references | null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one_attached :buy

## buys テーブル
| Column       | Type       |       Options                  |
| -------------| ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| product_name | string     | null: false                    |
### Association
- belongs_to :user
- belongs_to :item
- has_one :b_information


## b_informations テーブル
| Column     | Type       |       Options                  |
| ---------- | ---------- | ------------------------------ |
| genre_id   | string     | null: false |
| genre_id   | string     | null: false |
| local      | string     | null: false |
| address    | string     | null: false |
| building   | string     |             |
| phone      | string     | null: false |
| item       | references | null: false,foreign_key: true  |
### Association
- belongs_to :buy