# Criteria Template

Modern Next.js template for Criteria projects.

![preview](preview.png)

## 📑 Table of Contents

- [Features](#-features)
- [Getting Started](#-getting-started)
- [Development Workflow](#-development-workflow)
- [Testing & Quality Assurance](#-testing--quality-assurance)
- [Deployment](#-deployment)
- [Project Configuration & Customization](#-project-configuration--customization)
- [Resources & Community](#-resources--community)
- [License](#-license)

## 📋 Features

- **App Router** - Next.js application with App Router architecture
- **TypeScript** - Type-safe development with TypeScript
- **Tailwind CSS** - Utility-first CSS framework
- **Shadcn UI** - Accessible and customizable component library
- **Authentication** - User authentication with next-auth
- **Internationalization** - Multi-language support with next-intl
- **Payment Integration** - Payment processing with Stripe
- **Dark Mode** - Theme support with next-themes
- **Toast Notifications** - User notifications with sonner
- **React Context** - State management with React Context API

## 🚀 Getting Started

This repository is set up as a template that you can quickly use to start new projects.

### Option 1: Use the Creation Script (Recommended)

```bash
# Using curl
curl -fsSL https://raw.githubusercontent.com/criteria/nextjs-template/main/create-criteria-app.sh | bash -s my-project

# Or clone and run
git clone https://github.com/criteria/nextjs-template.git
./nextjs-template/create-criteria-app.sh my-project
```

This script:

- Creates a new project based on the template
- Runs interactive setup with customization options
- Optionally creates a GitHub repository
- Automatically pushes to the created repository

**Requirements:** curl, jq, git, GitHub Personal Access Token (for repo creation)

### Option 2: GitHub Template

1. Click the "Use this template" button on GitHub
2. Clone your new repository
3. Run the setup script to customize your project:

   ```bash
   pnpm setup
   # or
   npm run setup
   ```

### Option 3: Manual Clone

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

### Quick Start

1. Install dependencies

   ```bash
   pnpm install
   # or
   make install
   ```

2. Run the development server

   ```bash
   pnpm dev
   # or
   make dev
   ```

### Quick Start with Makefile

The template includes a powerful Makefile that simplifies common development tasks:

1. View all available commands:

   ```bash
   make help
   ```

2. Development workflow:

   ```bash
   # Install dependencies
   make install
   
   # Start development server
   make dev
   
   # Build for production
   make build
   
   # Start production server
   make start
   ```

3. Code quality:

   ```bash
   # Run all tests
   make test
   
   # Check TypeScript types
   make test-typescript
   
   # Run markdown tests
   make test-markdown
   
   # Lint code
   make lint
   
   # Fix markdown issues
   make lint-md-fix
   ```

4. Maintenance:

   ```bash
   # Check for outdated dependencies
   make check-deps
   
   # Run security checks
   make security-check
   
   # Clean build artifacts
   make clean
   ```

5. Deployment:

   ```bash
   # Deploy to Vercel
   make deploy-vercel
   
   # Deploy to Cloudflare
   make deploy-cf
   ```

## 🔧 Development Workflow

### Development Tools

This project includes a Makefile to simplify common development tasks. To see all available commands:

```bash
make help
```

### Common Commands

- **Development:**
  - `make install` - Install dependencies
  - `make dev` - Start development server
  - `make build` - Build the project
  - `make start` - Start production server

- **Code Quality:**
  - `make lint` - Run linters (JavaScript/TypeScript)
  - `make lint-md` - Run markdown linter
  - `make lint-md-fix` - Fix markdown linting issues

- **Testing:**
  - `make test` - Run all tests
  - `make test-markdown` - Run markdown tests
  - `make test-typescript` - Run TypeScript type checking

- **Maintenance:**
  - `make check-deps` - Check for outdated dependencies
  - `make security-check` - Run security audit
  - `make clean` - Clean build artifacts

- **Deployment:**
  - `make deploy-vercel` - Deploy to Vercel
  - `make deploy-cf` - Deploy to Cloudflare

## 🧪 Testing & Quality Assurance

### TypeScript Type Checking

Validate that your code follows TypeScript's type system correctly:

```bash
./tests/test-typescript.sh
# or
make test-typescript
```

### Markdown Linting

This project uses markdownlint-cli2 to automatically fix common markdown linting issues. When you save a markdown file or commit changes, linting rules will be automatically applied.

- To manually lint markdown files:

  ```bash
  pnpm lint:md
  # or
  make lint-md
  ```

- To fix markdown issues:

  ```bash
  pnpm lint:md:fix
  # or
  make lint-md-fix
  ```

VS Code users with the markdownlint extension will see real-time linting feedback and can enable format-on-save.

Testing the markdown linting setup:

```bash
./tests/run-markdown-tests.sh
# or
make test-markdown
```

This verifies:

- Detection of common markdown issues
- Automatic fixing of fixable issues
- Pre-commit hook functionality
- VS Code format-on-save simulation

### Dependency Management

Check for outdated dependencies:

```bash
./tests/check-dependencies.sh
# or
make check-deps
```

This helps ensure your project is using the most up-to-date and secure dependency versions.

### Security Checks

Scan your dependencies for known security vulnerabilities:

```bash
./tests/security-check.sh
# or
make security-check
```

This runs an audit of your dependencies and reports any security issues found.

## 🚢 Deployment

### Deploy to Vercel

The easiest way to deploy your Next.js app is with Vercel:

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fcriteria%2Fnextjs-template&project-name=my-criteria-project&repository-name=my-criteria-project)

Or via command line:

```bash
make deploy-vercel
```

### Deploy to Cloudflare

1. Customize your environment variables

   ```bash
   cp .env.example .env.production
   cp wrangler.toml.example wrangler.toml
   ```

2. Edit your environment variables in `.env.production` and put all the environment variables under `[vars]` in `wrangler.toml`

3. Deploy

   ```bash
   make deploy-cf
   # or
   npm run cf:deploy
   ```

## ⚙️ Project Configuration & Customization

### Environment Variables

Set up your environment variables:

```bash
cp .env.example .env.local
```

### Theming

Customize your theme in `app/theme.css`

Use the [shadcn-ui-theme-generator](https://zippystarter.com/tools/shadcn-ui-theme-generator) to create a custom theme.

### Internationalization

- Set your landing page content in `i18n/pages/landing`
- Set your i18n messages in `i18n/messages`

## 📚 Resources & Community

- [Criteria](https://criteria.dev)
- [Documentation](https://docs.criteria.dev)
- [Template Documentation](TEMPLATE.md) - Detailed documentation for this template
- [ShipAny Documentation](https://docs.shipany.ai/en) - Official ShipAny documentation (the base framework this template is built on)

This template is based on ShipAny's Next.js boilerplate, which we've licensed for internal use at Criteria. The ShipAny documentation provides comprehensive guidance on many features included in this template, including:

- Authentication setup
- Payment integration
- Internationalization
- Database configuration
- Deployment options
- Component customization

We recommend referencing the ShipAny documentation alongside our template-specific documentation when building your projects.

## 📄 License

- [Criteria Next.js Template License](LICENSE)
