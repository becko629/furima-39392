# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | string | null: false |

### Association

-has_many :items
-has_many :purchase_records

## items テーブル

| Column          | Type   | Options                            |
| ----------------| ------ | -----------------------------------|
| title           | string | null: false                        |
| description     | string | null: false                        |
| image           | text   | null: false                        |
| category        | string | null: false                        |
| condition       | string | null: false                        |
| shipping_area   | string | null: false                        |
| shipping_days   | string | null: false                        |
| shipping_charges| string | null: false                        |
| price           | string | null: false                        |
| user            | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :purchase_records

## purchase_records テーブル

| Column      | Type   | Options                            |
| ------------| ------ | -----------------------------------|
| address     | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

-belongs_to :address
-belongs_to :item
-belongs_to :user

## address テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| post_code        | string | null: false |
| prefectures      | string | null: false |
| city             | string | null: false |
| street_address   | string | null: false |
| building_name    | string | null: false |
| phone_number     | string | null: false |

### Association

-has_many :purchase_records