

## users テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |

### Association
- has_many :albums
- has_many :items
- has_many :genres



## albums テーブル
| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| title     | text      | null: false                    |
| user_id   | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :items, through: album_items
- has_many :genres, through: album_genres



## items テーブル
| Column     | Type           | Options                        |
| ---------- | -------------- | ------------------------------ |
| user_id    | references     | null: false, foreign_key: true |
| genre_id   | references     | null: false, foreign_key: true |
| title      | text           | null: false                    |
| url        | text           | null: false                    |
| image      | Active Storage | null: false                    |

### Association
- belongs_to :user
- belongs_to :genre
- has_many :albums, through: album_items



## genres テーブル
| Column | Type | Options     |
| ------ | ---- | ----------- |
| name   | text | null: false |

### Association
- belongs_to :user
- has_many :albums, through: album_genres
- has_many :items, through: album_items



## album_genres テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| album_id | references | null: false, foreign_key: true |
| genre_id | references | null: false, foreign_key: true |

### Association
- belongs_to :album
- belongs_to :genre



## album_items
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| album_id | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :album
- belongs_to :item