# ShipAny Template One

Ship Any AI SaaS Startups in hours.

![preview](preview.png)

## Using as a Template

This repository is set up as a template that you can quickly use to start new projects:

### Method 1: GitHub Template (Recommended)

1. Click the "Use this template" button on GitHub
2. Clone your new repository
3. Run the setup script to customize your project:
   ```bash
   pnpm setup
   # or 
   npm run setup
   ```

### Method 2: Clone and Setup Manually

1. Clone the repository
   ```bash
   git clone https://github.com/shipanyai/shipany-template-one.git my-project
   ```
2. Navigate to the project directory
   ```bash
   cd my-project
   ```
3. Run the setup script
   ```bash
   pnpm setup
   # or
   npm run setup
   ```

### Method 3: Use the Creation Script

Use our standalone script to create a new project:

```bash
# Using curl
curl -fsSL https://raw.githubusercontent.com/shipanyai/shipany-template-one/main/create-shipany-app.sh | bash -s my-project

# Or clone and run
git clone https://github.com/shipanyai/shipany-template-one.git
./shipany-template-one/create-shipany-app.sh my-project
```

For detailed template documentation, see [TEMPLATE.md](TEMPLATE.md).

## Quick Start

1. Install dependencies

```bash
pnpm install
```

2. Run the development server

```bash
pnpm dev
```

## Customize

- Set your environment variables

```bash
cp .env.example .env.local
```

- Set your theme in `app/theme.css`

[shadcn-ui-theme-generator](https://zippystarter.com/tools/shadcn-ui-theme-generator)

- Set your landing page content in `i18n/pages/landing`

- Set your i18n messages in `i18n/messages`

## Deploy

- Deploy to Vercel

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fshipanyai%2Fshipany-template-one&project-name=my-shipany-project&repository-name=my-shipany-project&redirect-url=https%3A%2F%2Fshipany.ai&demo-title=ShipAny&demo-description=Ship%20Any%20AI%20Startup%20in%20hours%2C%20not%20days&demo-url=https%3A%2F%2Fshipany.ai&demo-image=https%3A%2F%2Fpbs.twimg.com%2Fmedia%2FGgGSW3La8AAGJgU%3Fformat%3Djpg%26name%3Dlarge)

- Deploy to Cloudflare

1. Customize your environment variables

```bash
cp .env.example .env.production
cp wrangler.toml.example wrangler.toml
```

edit your environment variables in `.env.production`

and put all the environment variables under `[vars]` in `wrangler.toml`

2. Deploy

```bash
npm run cf:deploy
```

## Community

- [ShipAny](https://shipany.ai)
- [Documentation](https://docs.shipany.ai)
- [Discord](https://discord.gg/HQNnrzjZQS)

## License

- [ShipAny AI SaaS Boilerplate License Agreement](LICENSE)
