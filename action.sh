#!/bin/bash
set -e

# Install Theme Kit
curl -s https://shopify.github.io/themekit/scripts/install.py

# Configure Theme Kit
theme configure --password=${{ secrets.SHOPIFY_APP_API_PASSWORD }} --store=${{ secrets.SHOPIFY_STORE_URL }} --themeid=${{ secrets.SHOPIFY_THEME_ID }} --dir=${{ secrets.THEME_PATH }} --ignored-file=config/settings_data.json --ignored-file=locales/*

# Deploying to theme (allowing live themes)
theme deploy --allow-live