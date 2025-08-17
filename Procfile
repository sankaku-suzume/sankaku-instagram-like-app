web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -e production
release: NODE_OPTIONS="--openssl-legacy-provider" bundle exec rake db:migrate