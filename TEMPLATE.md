# Criteria Next.js Template Documentation

This is a detailed technical documentation for the Criteria Next.js template. It covers architecture, customization options, and best practices for building with this template.

## 📑 Table of Contents

- [Template Overview](#template-overview)
- [Technical Architecture](#technical-architecture)
- [Key Files & Directories](#key-files--directories)
- [Environment Variables](#environment-variables)
- [Core Features](#core-features)
- [Customization Guide](#customization-guide)
- [Deployment Options](#deployment-options)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

## Template Overview

This template is built on ShipAny's Next.js boilerplate, enhanced and customized for Criteria projects. It provides a robust foundation for building modern web applications with Next.js, featuring:

- App Router architecture for improved routing and layouts
- TypeScript for type safety throughout the application
- Tailwind CSS and Shadcn UI for consistent styling
- Authentication, internationalization, and payment processing
- Comprehensive testing and quality assurance tools

## Technical Architecture

### Project Structure

```text
.
├── app/                  # Next.js App Router
│   ├── [locale]/         # Locale-specific pages
│   ├── api/              # API routes
│   └── theme.css         # Theme styles
├── auth/                 # Authentication configuration
├── components/           # React components
│   ├── blocks/           # Layout blocks (header, footer)
│   └── ui/               # Reusable UI components
├── contexts/             # React contexts
├── i18n/                 # Internationalization
│   ├── pages/            # Page-specific translations
│   └── messages/         # Global messages
├── lib/                  # Custom libraries and utilities
├── models/               # Data models
├── public/               # Static assets
├── services/             # Business logic
├── tests/                # Test scripts and utilities
└── types/                # TypeScript type definitions
```

### Technology Stack

- **Frontend Framework**: Next.js 15 with App Router
- **Language**: TypeScript
- **Styling**: Tailwind CSS with Shadcn UI
- **State Management**: React Context API
- **Authentication**: NextAuth.js
- **Internationalization**: next-intl
- **Payment Processing**: Stripe
- **Notifications**: Sonner
- **Package Manager**: pnpm (preferred)
- **Build Tools**: Makefile, custom scripts
- **Deployment**: Vercel, Cloudflare Pages

## Key Files & Directories

### Core Configuration Files

- `next.config.mjs` - Next.js configuration
- `tailwind.config.ts` - Tailwind CSS configuration
- `tsconfig.json` - TypeScript configuration
- `.markdownlint-cli2.jsonc` - Markdown linting rules
- `package.json` - Dependencies and scripts
- `Makefile` - Build and utility commands

### Essential Components

- `app/[locale]/layout.tsx` - Main application layout
- `components/blocks/Header.tsx` - Header component
- `components/blocks/Footer.tsx` - Footer component
- `contexts/AppContext.tsx` - Main application context

## Environment Variables

The template uses environment variables for configuration. Create a `.env.local` file based on `.env.example`:

### Critical Variables

- `NEXT_PUBLIC_APP_URL` - Your application URL
- `NEXTAUTH_URL` - Your authentication URL (for NextAuth)
- `NEXTAUTH_SECRET` - Secret for NextAuth (generate with `openssl rand -base64 32`)

### Optional Variables

- `STRIPE_SECRET_KEY` - Stripe secret key (if using payments)
- `STRIPE_WEBHOOK_SECRET` - Stripe webhook secret
- `NEXT_PUBLIC_GOOGLE_ANALYTICS` - Google Analytics ID

See `.env.example` for the complete list of available variables.

## Core Features

### Authentication

Authentication is handled through NextAuth.js, configured in the `auth` directory. The template supports:

- Email/password authentication
- OAuth providers (Google, GitHub, etc.)
- JWT sessions with customizable callbacks

### Internationalization

The template uses next-intl for internationalization:

- Default locale and supported locales are configured in `i18n/config.ts`
- Messages are stored in `i18n/messages/[locale].json`
- Page-specific translations in `i18n/pages/[page]/[locale].json`

#### Verifying Internationalization

To test the internationalization setup:

1. Check available locales in the locale configuration:

```bash
cat i18n/locale.ts
```

1. Verify messages for each language in the `i18n/messages` directory:

```bash
ls i18n/messages
# Should show files like en.json, zh.json, etc.
```

1. Test language switching functionality in the browser by appending locale to the URL:
   - English: `http://localhost:3000/en`
   - Chinese: `http://localhost:3000/zh`

1. Use the locale selector component to switch between languages and verify the content updates correctly.

### UI Components

UI components are built with Shadcn UI and Tailwind CSS:

- Base components in `components/ui/`
- Layout blocks in `components/blocks/`
- Page-specific components with the pages they're used in

## Customization Guide

### Theme Customization

1. Edit `app/theme.css` to modify the color scheme
2. Use the [shadcn-ui-theme-generator](https://zippystarter.com/tools/shadcn-ui-theme-generator) for easy theme creation
3. Modify `tailwind.config.ts` for advanced Tailwind customization

### Adding New Pages

1. Create a new page in `app/[locale]/your-page/page.tsx`
2. Add translations in `i18n/pages/your-page/[locale].json`
3. Update navigation in `components/blocks/Header.tsx` if needed

### Adding API Routes

Create new API routes in `app/api/your-endpoint/route.ts` following the App Router conventions.

## Deployment Options

### Vercel Deployment

The easiest way to deploy this template is with Vercel:

1. Push your repository to GitHub
2. Connect Vercel to your repository
3. Configure environment variables in Vercel's dashboard
4. Deploy

### Cloudflare Pages

To deploy to Cloudflare Pages:

1. Configure environment variables:

   ```bash
   cp .env.example .env.production
   cp wrangler.toml.example wrangler.toml
   ```

2. Update the variables in `.env.production` and `wrangler.toml`

3. Deploy using the provided script:

   ```bash
   npm run cf:deploy
   ```

### Docker Deployment

Build and run as a Docker container:

```bash
npm run docker:build
docker run -p 3000:3000 criteria-template:latest
```

### Testing the Creation Script

Before sharing this template, it's recommended to test the creation script to ensure it functions correctly:

1. Test the script locally:

   ```bash
   ./create-criteria-app.sh test-project
   ```

2. Verify the new project structure and functionality:

   ```bash
   cd test-project
   pnpm install
   pnpm dev
   ```

3. Key aspects to verify in the test project:
   - Environment variables configuration
   - Authentication setup
   - Internationalization
   - Routing functionality
   - Proper styles and theming

## Best Practices

### Code Organization

- Keep components small and focused on a single responsibility
- Use TypeScript types for all props and data structures
- Group related functionality in custom hooks
- Follow the directory structure for consistency

### Performance Optimization

- Use Next.js Image component for optimized images
- Implement proper code splitting with dynamic imports
- Minimize client-side JavaScript with Server Components
- Utilize `useMemo` and `useCallback` for expensive operations

### Security Considerations

- Store sensitive information in environment variables
- Validate all user inputs on the server
- Use HTTPS for all API requests
- Keep dependencies updated regularly with `make check-deps`

### Continuous Integration

This template includes GitHub Actions workflows for continuous integration:

- Automatic TypeScript type checking
- Markdown linting and validation
- Dependency checks
- Security vulnerability scanning
- Build verification

To customize the CI workflow:

1. Edit the configuration in `.github/workflows/ci.yml`
2. Add additional test steps as needed
3. Configure notifications or integration with other services

## Troubleshooting

### Common Issues

#### Build Errors

- **Issue**: TypeScript errors during build
  **Solution**: Run `make test-typescript` to identify and fix type issues

- **Issue**: Dependency conflicts
  **Solution**: Clear node_modules and reinstall with `rm -rf node_modules && pnpm install`

#### Development Server Issues

- **Issue**: Hot reload not working
  **Solution**: Restart the development server with `make dev`

- **Issue**: API routes returning 500 errors
  **Solution**: Check environment variables and server logs

### Getting Help

If you encounter issues not covered here:

1. Check the [Criteria documentation](https://docs.criteria.dev)
2. Reference the [ShipAny documentation](https://docs.shipany.ai/en)
3. Reach out to the Criteria team for support

---

Happy building with Criteria! 🚀
