# FURIMA
<img width="1150" alt="furima" src="https://user-images.githubusercontent.com/73518765/104890022-56307880-59b2-11eb-96e0-893e71353a59.png">

### URL
https://furima-32053.herokuapp.com/

### IDとパスワード
ID: admin
<br>password: 2222

### 出品者
Email: sample@sample.com
<br>password: aaa111

### 購入者
Email: sample2@sample.com
<br>password: aaa111

### テストクレジットカード情報
番号: 42424242424242
<br>期限: 3/24
<br>コード: 123

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
