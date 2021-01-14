# Shopify Rapid Deploy Action

A GitHub action for rapid deployment of Shopify themes.

## Usage

The action requires 4 enviroment variables to run, they are listed below.

```yml
      - uses: bravetheskies/shopify-rapid-deploy-action@v1
        env:
          SHOPIFY_APP_API_PASSWORD: ${{ secrets.SHOPIFY_APP_API_PASSWORD }}
          SHOPIFY_STORE_URL: ${{ secrets.SHOPIFY_STORE_URL }}
          SHOPIFY_THEME_ID: ${{ secrets.SHOPIFY_THEME_ID }}
          THEME_PATH: ${{ secrets.SHOPIFY_THEME_PATH }}
```

## Examples

Basic full example:

```yml
name: Deploy Theme
on: [workflow_dispatch]
jobs:
  build:
    name: Deploy Theme
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2
      - name: Deploy theme
        uses: bravetheskies/shopify-rapid-deploy-action@v1
        env:
          SHOPIFY_APP_API_PASSWORD: ${{ secrets.SHOPIFY_APP_API_PASSWORD }}
          SHOPIFY_STORE_URL: ${{ secrets.SHOPIFY_STORE_URL }}
          SHOPIFY_THEME_ID: ${{ secrets.SHOPIFY_THEME_ID }}
          THEME_PATH: ${{ secrets.SHOPIFY_THEME_PATH }}
```

With flags from [Shopify Theme Kit Configuration](https://shopify.github.io/themekit/configuration/#flags):

```yml
name: Deploy Theme
on: [workflow_dispatch]
jobs:
  build:
    name: Deploy Theme
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2
      - name: Deploy theme
        uses: bravetheskies/shopify-rapid-deploy-action@v1
        env:
          SHOPIFY_APP_API_PASSWORD: ${{ secrets.SHOPIFY_APP_API_PASSWORD }}
          SHOPIFY_STORE_URL: ${{ secrets.SHOPIFY_STORE_URL }}
          SHOPIFY_THEME_ID: ${{ secrets.SHOPIFY_THEME_ID }}
          THEME_PATH: ${{ secrets.SHOPIFY_THEME_PATH }}
          THEMEKIT_FLAGS: --ignored-file=config/settings_data.json --ignored-file=locales/*
```