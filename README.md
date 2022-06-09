# テーブル設計

## users テーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| date_of_birth      | string | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| prefecture         | string     | null: false                    |
| days_to_ship       | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     | null: false                    |
| tel_num            | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
