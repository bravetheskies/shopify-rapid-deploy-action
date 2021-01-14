#!/bin/bash
set -e

# Install Theme Kit
curl -s https://shopify.github.io/themekit/scripts/install.py | sudo python

# Configure Theme Kit
theme configure --password=$SHOPIFY_APP_API_PASSWORD --store=$SHOPIFY_STORE_URL --themeid=$SHOPIFY_THEME_ID --dir=$THEME_PATH --ignored-file=config/settings_data.json --ignored-file=locales/*

# Deploying to theme (allowing live themes)
theme deploy --allow-live