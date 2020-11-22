# web-task
Bookers2 Web Application

# 前提
- [Ruby (2.6.3)](https://www.ruby-lang.org/ja/)
- [Ruby on Rails (5.2.4.4)](https://github.com/rails/rails)

# 利用方法

## ローカル環境での起動
1. bundle installしライブラリをインストールする。

  ```shell
  bundle install
  ```

2. DBを作成(マイグレーション)する。

  ```shell
  rails db:migrate
  ```
  
3. Ruby on Rails(puma)を起動する。

  ```shell
  rails server
  ```

4. ブラウザにて以下URLにアクセスする。
 - http://localhost:3000/


## テストの実行
1. テスト用DBを作成(マイグレーション)する。

  ```shell
  rails db:migrate RAILS_ENV=test
  ```

2. RSpec テストを実行する。

  ```shell
  bundle exec rspec spec/ --format documentation
  ```
  