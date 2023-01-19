# Shopify Rapid Deploy Action

A GitHub action for rapid deployment of Shopify themes.

## Usage

The action requires 4 environment variables to run and has one optional variable, they are listed below.

* `SHOPIFY_APP_API_PASSWORD` - API password for your Shopify app.
* `SHOPIFY_STORE_URL` - The store URL in format `my-store.myshopify.com` of your store.
* `SHOPIFY_THEME_ID` - The ID of the theme to deploy to.
* `THEME_PATH` - The path of your theme in your repository. If root use `./`.
* `THEMEKIT_FLAGS` (optional) - [Shopify Theme Kit configuration flags](https://shopify.github.io/themekit/configuration/#flags).

It is recommended that you use [encrypted secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) for your environment details.

They can easily be used in your workflow configuration like so:

```yml
...
- uses: bravetheskies/shopify-rapid-deploy-action@v1
  env:
    SHOPIFY_APP_API_PASSWORD: ${{ secrets.SHOPIFY_APP_API_PASSWORD }}
    SHOPIFY_STORE_URL: ${{ secrets.SHOPIFY_STORE_URL }}
    SHOPIFY_THEME_ID: ${{ secrets.SHOPIFY_THEME_ID }}
    THEME_PATH: ${{ secrets.SHOPIFY_THEME_PATH }}
...
```

## Examples

Basic full workflow example:

```yml
name: Deploy theme
on: [workflow_dispatch]
jobs:
  build:
    name: Deploy theme
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@main
      - name: Deploy theme
        uses: bravetheskies/shopify-rapid-deploy-action@v1
        env:
          SHOPIFY_APP_API_PASSWORD: ${{ secrets.SHOPIFY_APP_API_PASSWORD }}
          SHOPIFY_STORE_URL: ${{ secrets.SHOPIFY_STORE_URL }}
          SHOPIFY_THEME_ID: ${{ secrets.SHOPIFY_THEME_ID }}
          THEME_PATH: ${{ secrets.SHOPIFY_THEME_PATH }}
```

Example with flags from [Shopify Theme Kit configuration](https://shopify.github.io/themekit/configuration/#flags):

```yml
name: Deploy theme
on: [workflow_dispatch]
jobs:
  build:
    name: Deploy theme
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@main
      - name: Deploy theme
        uses: bravetheskies/shopify-rapid-deploy-action@v1
        env:
          SHOPIFY_APP_API_PASSWORD: ${{ secrets.SHOPIFY_APP_API_PASSWORD }}
          SHOPIFY_STORE_URL: ${{ secrets.SHOPIFY_STORE_URL }}
          SHOPIFY_THEME_ID: ${{ secrets.SHOPIFY_THEME_ID }}
          THEME_PATH: ${{ secrets.SHOPIFY_THEME_PATH }}
          THEMEKIT_FLAGS: --ignored-file=config/settings_data.json --ignored-file=locales/*
```
