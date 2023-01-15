# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | string     | null: false                    |
| explanation   | string     | null: false                    |
| category      | integer    | null: false                    |
| state         | integer    | null: false                    |
| postage       | integer    | null: false                    |
| area          | integer    | null: false                    |
| sipping_days  | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## places テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| postal_code   | string     | null: false                     |
| prefectures   | integer    | null: false                     |
| city          | string     | null: false                     |
| house_number  | string     | null: false                     |
| building      | string     |                                 |
| tel_number    | string     | null: false                     |
| buy           | references | null: false, foreign_key: true  |

### Association

- belongs_to :buy

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| place   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :place