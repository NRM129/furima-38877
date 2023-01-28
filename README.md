# テーブル設計

## users テーブル

| Column                  | Type   | Options          |
| ----------------------- | ------ | ---------------- |
| nickname                | string | null: false      |
| email                   | string | uniqueness: true |df
| encrypted_password      | string | null: false      |df
| first_name              | string | null: false      |
| last_name               | string | null: false      |
| first_name_kana         | string | null: false      |
| last_name_kana          | string | null: false      |
| birthday                | date   | null: false      |


### Association

- has_many :items
- has_many :purchases_item



## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| item_name                 | string     | null: false                    |
| explanation               | text       | null: false                    |
| category                  | string     | null: false                    |
| states                    | string     | null: false                    |
| postage_type              | string     | null: false                    |
| prefecture                | string     | null: false                    |
| preparation_days          | string     | null: false                    |
| value                     | string     | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases_item



## purchases_item テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchases_info




## purchases_info テーブル

| Column             | Type   | Options        |
| ------------------ | ------ | ---------------|
| post_code          | string | null: false    |
| prefectures_info   | string | null: false    |
| city               | string | null: false    |
| address            | string | null: false    |
| building_name      | string |                |
| phone_number       | string | null: false    |


### Association

- belongs_to :purchases_item