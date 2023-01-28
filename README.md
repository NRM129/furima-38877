# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |df
| encrypted_password | string | null: false |df
| first_name         | string | null: false |
| last_name          | string | null: false |
| birthday_year      | string | null: false |
| birthday_month     | string | null: false |
| birthday_day       | string | null: false |

### Association

- has_many :items
- has_many :purchase



## items テーブル

| Column                    | Type   | Options                        |
| ------------------------- | ------ | ------------------------------ |
| item_name                 | string | null: false                    |
| explanation               | string | null: false                    |
| category                  | string | null: false                    |
| states                    | string | null: false                    |
| postage_type              | string | null: false                    |
| prefecture                | string | null: false                    |
| preparation_days          | string | null: false                    |
| value                     | string | null: false                    |
| user                      | string | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_item



## purchase_item テーブル

| Column      | Type   | Options                        |
| ----------- | ------ | ------------------------------ |
| item        | string | null: false, foreign_key: true |
| user        | string | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address




## purchase_info テーブル

| Column             | Type   | Options        |
| ------------------ | ------ | ---------------|
| post_code          | string | null: false    |
| prefectures_info   | string | null: false    |
| city               | string | null: false    |
| address            | string | null: false    |
| prefectures_info   | string | null: false    |
| building_name      | string |                |
| phone_number       | string | null: false    |


### Association

- belongs_to :address