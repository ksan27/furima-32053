# README

## usersテーブル

|Column              |Type    |Options      |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading  | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

|Column              |Type     |Options      |
|--------------------|---------|-------------|
| name               | string  | null: false |
| explanation        | text    | null: false |
| category_id        | integer | null: false |
| status_id          | integer | null: false |
| shipping_fee_id    | integer | null: false |
| shipping_prefecture_id| integer    | null: false |
| shipping_day_id       | integer    | null: false |
| price                 | integer    | null: false |
| user                  | references | null: false, foreign_key: true|

### Association

- has_one :purchase
- belongs_to :user

## purchasesテーブル

|Column         |Type        |Options                        |
|---------------|------------|-------------------------------|
| item          | references | null: false, foreign_key: true|
| user          | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

|Column                |Type        |Options                        |
|----------------------|------------|-------------------------------|
| purchase             | references | null: false, foreign_key: true|
| postal_code          | string     | null: false |
| prefecture_id        | integer    | null: false |
| city                 | string     | null: false |
| house_number         | string     | null: false |
| building_name        | string     |             |
| phone_number         | string     | null: false |

### Association

- belongs_to :purchase