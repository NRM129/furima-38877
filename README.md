# テーブル設計

## users テーブル

| Column                  | Type   | Options           |
| ----------------------- | ------ | ----------------  |
| nickname                | string | null: false       |
| email                   | string | unique: true 　　　|df
| encrypted_password      | string | null: false       |df
| first_name              | string | null: false       |
| last_name               | string | null: false       |
| first_name_kana         | string | null: false       |
| last_name_kana          | string | null: false       |
| birthday                | date   | null: false       |


### Association

- has_many :items
- has_many :orders



## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| item_name                 | string     | null: false                    |
| explanation               | text       | null: false                    |
| category_id               | integer    | null: false                    |
| condition_id              | integer    | null: false                    |
| postage_id                | integer    | null: false                    |
| prefecture_id             | integer    | null: false                    |
| preparation_id            | integer    | null: false                    |
| price                     | integer     | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- belongs_to :category_id
- belongs_to :condition_id
- belongs_to :postage_id
- belongs_to :prefecture_id
- belongs_to :preparation_id
- has_one_attached :image



## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :payment




## payments テーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | -----------------------------------|
| post_code          | string     | null: false                        |
| prefecture_id　　　 | integer    | null: false                        |
| city               | string     | null: false                        |
| address            | string     | null: false                        |
| building_name      | string     |                                    |
| phone_number       | string     | null: false                        |
| order　　           | references | null: false, foreign_key: true     |

### Association

- belongs_to :order



## ActiveHash

| model            | 
| ---------------- | 
| category         | 
| condition.       | 
| postage          | 
| prefecture       | 
| preparation      | 


| active_storage      | 
| ------------------- | 
| image               | 