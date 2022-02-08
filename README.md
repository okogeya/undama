# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :events

## events テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     |                                |
| text           | text       | null: false                    |
| happy_level_id | integer    | null: false                    |
| public_id      | integer    | null: false                    |
| day            | date       | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belong_to :user

