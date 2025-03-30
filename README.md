# Criteria Template

Modern Next.js template for Criteria projects.

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
   git clone https://github.com/criteria/nextjs-template.git my-project
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

### Method 3: Use the Creation Script (Recommended)

Use our standalone script to create a new project with option to automatically create a GitHub repository:

```bash
# Using curl
curl -fsSL https://raw.githubusercontent.com/criteria/nextjs-template/main/create-criteria-app.sh | bash -s my-project

# Or clone and run
git clone https://github.com/criteria/nextjs-template.git
./nextjs-template/create-criteria-app.sh my-project
```

The script offers these features:

- Creates a new project based on the template
- Interactive setup with customization options
- Optional GitHub repository creation
- Automatic push to the created repository

**Requirements for GitHub repo creation:**

- curl
- jq
- git
- GitHub Personal Access Token with 'repo' scope

For detailed template documentation, see [TEMPLATE.md](TEMPLATE.md).

## Quick Start

1. Install dependencies

```bash
pnpm install
```

1. Run the development server

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

## Markdown Linting

This project uses markdownlint-cli2 to automatically fix common markdown linting issues. When you save a markdown file or commit changes, linting rules will be automatically applied.

- To manually lint markdown files:

```bash
pnpm lint:md
```

- To fix markdown issues:

```bash
pnpm lint:md:fix
```

VS Code users with the markdownlint extension will see real-time linting feedback and can enable format-on-save.

### Testing Markdown Linting

A test suite is available to verify the markdown linting configuration:

```bash
# Run all tests
./tests/run-markdown-tests.sh

# Or run individual tests
./tests/test-markdown-linting.sh
./tests/test-pre-commit.sh
./tests/test-vscode-format.sh
```

These tests verify:

- Detection of common markdown issues
- Automatic fixing of fixable issues
- Pre-commit hook functionality
- VS Code format-on-save simulation

## Deploy

- Deploy to Vercel

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fcriteria%2Fnextjs-template&project-name=my-criteria-project&repository-name=my-criteria-project)

- Deploy to Cloudflare

1. Customize your environment variables

```bash
cp .env.example .env.production
cp wrangler.toml.example wrangler.toml
```

edit your environment variables in `.env.production`

and put all the environment variables under `[vars]` in `wrangler.toml`

1. Deploy

```bash
npm run cf:deploy
```

## Community

- [Criteria](https://criteria.dev)
- [Documentation](https://docs.criteria.dev)

## License

- [Criteria Next.js Template License](LICENSE)

## Documentation & Resources

- [Template Documentation](TEMPLATE.md) - Detailed documentation for this template
- [ShipAny Documentation](https://docs.shipany.ai/en) - Official ShipAny documentation (the base framework this template is built on)

This template is based on ShipAny's Next.js boilerplate, which we've licensed for internal use at Criteria. The [ShipAny documentation](https://docs.shipany.ai/en) provides comprehensive guidance on many features included in this template, including:

- Authentication setup
- Payment integration
- Internationalization
- Database configuration
- Deployment options
- Component customization

We recommend referencing the ShipAny documentation alongside our template-specific documentation when building your projects.
