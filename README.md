#### Install taglib
```
brew install taglib
```

```
gem install taglib-ruby
```

#### Clear data
```
bundle exec rake data:clear
```

#### Import data
```
bundle exec rake data:update
```

#### Dump database
```
pg_dump <DATABASE_NAME> | gzip > backup.gz
```

#### Backup dragonfly folder
```
zip -r dragonfly.zip dragonfly
```
