# Laboratory work 4 - GitOps and Helm

The repository layout contains a reusable Helm chart for `catalog-api`, value overrides for three environments, and an Argo CD Application for the development environment.

Render a chart:

```bash
helm template catalog-api helm/catalog-api -f helm/catalog-api/values.yaml -f helm/catalog-api/values-dev.yaml
```

Create or update the Argo CD application:

```bash
argocd app create catalog-api-dev --file argocd/catalog-api-dev.yaml --upsert
argocd app sync catalog-api-dev
argocd app wait catalog-api-dev --health --timeout 180
```
