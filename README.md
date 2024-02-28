##　users　テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

## comments　テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| title              | string | null: false |
| catch_copy         | string | null: false, unique: true |
| concept            | string | null: false |
| user               | text   | null: false |


## prototypes　テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| concept            | string | null: false |
| user               | text   | null: false |
| prototype          | references  | null: false ,foreign key|
