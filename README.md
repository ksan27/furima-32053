# README

## usersテーブル

|Column              |Type    |Options      |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading  | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

|Column      |Type    |Options      |
|------------|--------|-------------|
| image      | string | null: false |
| product    | string | null: false |
| explanation| string | null: false |
| category   | string | null: false |
| price      | string | null: false |
| status     | string | null: false |
| user       | references | null: false, foreign_key: true|

### Association

- has_one :purchase
- belongs_to :user

## purchasesテーブル

|Column         |Type        |Options                        |
|---------------|------------|-------------------------------|
| item          | references | null: false, foreign_key: true|
| user          | references | null: false, foreign_key: true|
| address       | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

|Column                |Type        |Options                       |
|----------------------|------------|------------------------------|
| item                 | references | null: false foreign_key: true|
| postal_code          | string     | null: false |
| prefecture           | string     | null: false |
| city                 | string     | null: false |
| house_number         | string     | null: false |
| building_name        | string     |             |
| phone_number         | string     | null: false |

### Association

- belongs_to :purchase