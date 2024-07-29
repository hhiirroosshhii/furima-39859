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
| email              | string  | null: false, unique: true, default: ""|
| encrypted_password | string  | null: false, unique: true, default: "" |
| last_name          | string  | null: false |
| first_name         | text    | null: false |
| last_name_kana     | text    | null: false |
| first_name_kana    | text    | null: false |
| ymd_year           | intager | null: false |
| ymd_month          | intager | null: false |
| ymd_day            | intager | null: false |
### Association
- belongs_to :item
- belongs_to :buy


## item テーブル
| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| product       | string     | null: false                   |
| content       | text       | null: false                   |
| category      | text       | null: false                   |
| status        | string     | null: false                   |
| price         | intager    | null: false                   |
| delivery_cost | intager    | null: false                   |
| delivery_area | string     | null: false                   |
| need_days     | intager    | null: false                   |
| user          | references | null: false, foreign_key: true|
### Association
- has_many :user
- belongs_to :buy
- has_one_attached :image

## buy テーブル
| Column      | Type       |       Options                  |
| ------------| ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| get_product | string     | null: false                    |
### Association
- has_many :user
- has_many :item
- has_one :b_information


## b_information テーブル
| Column     | Type       |       Options                  |
| ---------- | ---------- | ------------------------------ |
| postal     | string     | null: false |
| prefecture | string     | null: false |
| local      | string     | null: false |
| address    | string     | null: false |
| building   | string     | null: false |
| phone      | intager    | null: false |
| user       | references | null: false,foreign_key: true  |
### Association
- belongs_to :buy