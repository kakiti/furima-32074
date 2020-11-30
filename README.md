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

# テーブル設計


## users テーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false, unique: true |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| birth_year      | integer | null: false               |
| birth_month     | integer | null: false               |
| birth_day       | integer | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| concept    | text       | null: false                    |
| category   | string     | null: false                    |
| status     | string     | null: false                    |
| fee        | string     | null: false                    |
| prefecture | string     | null: false                    |
| schedule   | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order
- has_one :order

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| transaction | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :transaction


## transactions テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| shipping_prefecture | text       | null: false                    |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| building            | string     | null: false                    |
| phone_number        | string     | null: false                    |
| item                | references | null: false, foreign_key: true |

### Association

- has_one :item
- has_one :order