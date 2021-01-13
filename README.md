# Shopify Rapid Deploy Action

A GitHub action for rapid deployment of Shopify themes.

## Usage

```yml
- uses: bravetheskies/shopify-rapid-deploy-action@v1
  env:
    SHOPIFY_APP_API_PASSWORD: ${{ secrets.SHOPIFY_APP_API_PASSWORD }}
    SHOPIFY_STORE_URL: ${{ secrets.SHOPIFY_STORE_URL }}
    SHOPIFY_THEME_ID: ${{ secrets.SHOPIFY_THEME_ID }}
    THEME_PATH: ${{ secrets.SHOPIFY_THEME_PATH }}
```