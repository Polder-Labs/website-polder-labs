# website-polder-labs

Astro + Azure Static Web Apps template with Bicep-based infrastructure.

## Repository structure

- [app](app): Astro frontend
- [infra](infra): Azure infrastructure definitions
- [.github/workflows](.github/workflows): CI/CD and provisioning workflows

## Local development

1. `cd app`
2. `npm ci`
3. `npm run dev`

## Build

- `cd app && npm run build`

## Deployment flow

- Pull requests to `main`: run build validation only.
- Pushes to `main`: run build + deploy to Azure Static Web Apps.
- Infrastructure provisioning is manual via [ .github/workflows/provision-infra.yml ](.github/workflows/provision-infra.yml).

## Security notes

- Runtime headers and 404 behavior are defined in [app/public/staticwebapp.config.json](app/public/staticwebapp.config.json).
- Branch protection requires pull requests and status checks.
- SWA deployment token rotation procedure is documented in [infra/README.md](infra/README.md).
