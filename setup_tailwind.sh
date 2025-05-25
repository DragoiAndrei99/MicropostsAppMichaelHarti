#!/bin/bash
echo 'gem "tailwindcss-rails"' >> Gemfile

bundle install

bin/rails tailwindcss:install

cat <<EOL > Procfile.dev
web: bin/rails server -p 3000
css: bin/rails tailwindcss:watch
EOL

