## アプリケーション名：
* ポートフォリオアプリ

## アプリケーション概要 ： 
* 作成したwebアプリケーションをアイテムとしてアルバム管理ができます。ジャンルも編集登録が可能です。

## デプロイ先：
* 未デプロイ
## テスト用アカウント
### メールアドレス：
* test@test.com
### Password:
* 123qwe

## 利用方法
* ログイン後、アルバムとアイテムを作成します。
* アルバムの詳細ページでアイテムを登録する事が可能です。


## 目指した問題解決
* 作成したwebアプリはAWSやherokuなど様々なサーバー、様々なアカウントでデプロイされます。どのwebアプリをどこにデプロイしたのかわからなくなってしまわないように、情報を一元管理できるアプリを提案します。

## 洗い出した要件定義

* ログイン機能
* アルバム登録機能
* アルバム編集機能
* アルバム削除機能
* アイテム登録機能
* アイテム編集機能
* アイテム削除機能
* ジャンル登録機能
* ジャンル編集機能
* ジャンル削除機能
* アルバムアイテム登録機能
* アルバムアイテム登録削除機能
* 初期データ機能
* アイテム詳細webページ表示機能
* アルバム一覧webページ表示機能

## 実装した機能

* ログイン機能
* アルバム登録機能
* アルバム編集機能
* アルバム削除機能
* アイテム登録機能
* アイテム編集機能
* アイテム削除機能
* ジャンル登録機能
* ジャンル編集機能
* ジャンル削除機能
* アルバムアイテム登録機能
* アルバムアイテム登録削除機能
* 初期データ機能

## 実装予定の機能

* アイテム詳細webページ表示機能
* アルバム一覧webページ表示機能

## データベース設計

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


## ローカルでの動作方法
* git clone後、データベースを立ち上げRails db:seedを実行します。
* Rails sで起動します。