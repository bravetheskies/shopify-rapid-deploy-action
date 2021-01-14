#!/bin/bash
set -e

echo "Installing Theme Kit"
curl -s https://shopify.github.io/themekit/scripts/install.py | sudo python

echo "Configuring Theme Kit"
theme configure --password=$SHOPIFY_APP_API_PASSWORD --store=$SHOPIFY_STORE_URL --themeid=$SHOPIFY_THEME_ID --dir=$THEME_PATH --ignored-file=config/settings_data.json --ignored-file=locales/*

echo "Deploying Theme"
theme deploy --allow-live