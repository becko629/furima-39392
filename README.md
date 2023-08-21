# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

-has_many :items
-has_many :purchase_records

## items テーブル

| Column          | Type   | Options                            |
| ----------------| ------ | -----------------------------------|
| title           | string | null: false                        |
| description     | text   | null: false                        |
| category        | string | null: false                        |
| condition       | string | null: false                        |
| prefecture_id   | integer| null: false                        |
| shipping_days   | string | null: false                        |
| shipping_charges| string | null: false                        |
| price           | integer  null: false                        |
| user_id         | integer| null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :purchase_records

## purchase_records テーブル

| Column      | Type   | Options                            |
| ------------| ------ | -----------------------------------|
| item_id     | integer | null: false, foreign_key: true |
| user_id     | integer | null: false, foreign_key: true |

### Association

-has_one :address
-belongs_to :item
-belongs_to :user

## addresses テーブル

| Column             | Type   | Options     |
| -----------------  | ------ | ----------- |
| post_code          | string | null: false |
| prefecture_id      | integer| null: false |
| city               | string | null: false |
| street_address     | string | null: false |
| building_name      | string |             |
| phone_number       | string | null: false |
| purchase_record_id |integer | null: false, foreign_key: true |

### Association

-belongs_to :purchase_record