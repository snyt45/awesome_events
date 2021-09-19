# awesome_events
パーフェクトRailsの6章以降で作成するawesome_eventsのリポジトリ

## ビルド
```
# awesome_eventsという名前のイメージ作成
docker build . -t awesome_events --build-arg ruby_version=2.6.3 --build-arg rails_version=6.0.1

# awesome_eventsという名前のネットワーク作成
docker network create awesome_events

# awesome_eventsのネットワーク内にawesome_eventsというコンテナを作成
docker run --network awesome_events -d -t -v (pwd):/app -p 3000:3000 --name="awesome_events" awesome_events

# プロジェクト作成
docker exec -it awesome_events /bin/bash
rails new awesome_events --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-action-cable

# サーバー起動
cd awesome_events
rails s -p 3000 -b '0.0.0.0'
```

# コンテナ停止、起動
```
docker stop awesome_events
docker start awesome_events
```
