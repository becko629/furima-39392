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

| Column             | Type   | Options                            |
| ----------------   | ------ | -----------------------------------|
| title              | string | null: false                        |
| description        | text   | null: false                        |
| category_id        | integer| null: false                        |
| condition_id       | integer| null: false                        |
| prefecture_id      | integer| null: false                        |
| shipping_day_id    | integer| null: false                        |
| shipping_charge_id | integer| null: false                        |
| price              | integer| null: false                        |
| user               | integer| null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :purchase_record

## purchase_records テーブル

| Column      | Type   | Options                            |
| ------------| ------ | -----------------------------------|
| item        | integer | null: false, foreign_key: true |
| user        | integer | null: false, foreign_key: true |

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
| purchase_record    |integer | null: false, foreign_key: true |

### Association

-belongs_to :purchase_record