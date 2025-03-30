# ShipAny Next.js Template

This is a fully-featured Next.js template with modern features for quickly bootstrapping production-ready applications.

## Getting Started

### Option 1: Use as GitHub Template

1. Click the "Use this template" button on the GitHub repository
2. Clone your new repository
3. Run the setup script:

   ```bash
   npm run setup
   # or
   pnpm setup
   ```

4. Follow the interactive prompts to customize your project

### Option 2: Clone and Setup Manually

1. Clone this repository

   ```bash
   git clone https://github.com/yourusername/shipany-template-one.git my-project
   ```

2. Navigate to the project directory

   ```bash
   cd my-project
   ```

3. Run the setup script:

   ```bash
   npm run setup my-project-name
   # or
   pnpm setup my-project-name
   ```

4. Install dependencies:

   ```bash
   npm install
   # or
   pnpm install
   ```

5. Start the development server:

   ```bash
   npm run dev
   # or
   pnpm dev
   ```

## What's Included

This template comes with:

- ✅ **Next.js 15** with App Router
- ✅ **TypeScript** for type safety
- ✅ **Tailwind CSS** for styling
- ✅ **Shadcn UI** components for beautiful UI
- ✅ **Sonner** for toast notifications
- ✅ **React Context** for state management
- ✅ **Next-Auth** for authentication
- ✅ **Next-Intl** for internationalization
- ✅ **Stripe** for payment processing
- ✅ **Docker** support for containerization
- ✅ **Cloudflare** deployment support

## Project Structure

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
└── types/                # TypeScript type definitions
```

## Key Files to Customize

After setup, consider customizing these files:

1. `.env.local` - Environment variables (copied from `.env.example`)
2. `app/[locale]/layout.tsx` - Main layout including metadata
3. `components/blocks/Footer.tsx` - Footer component
4. `components/blocks/Header.tsx` - Header component
5. `public/logo.svg` - Your logo

## Environment Variables

Make sure to set up the following environment variables in `.env.local`:

- `NEXT_PUBLIC_APP_URL` - Your application URL
- `NEXTAUTH_URL` - Your authentication URL (for Next-Auth)
- `NEXTAUTH_SECRET` - Secret for Next-Auth
- `STRIPE_SECRET_KEY` - Stripe secret key (if using payments)
- `STRIPE_WEBHOOK_SECRET` - Stripe webhook secret (if using payments)

See `.env.example` for a complete list of available environment variables.

## Deployment

### Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/).

### Docker

Build and run as a Docker container:

```bash
npm run docker:build
docker run -p 3000:3000 shipany-template-one:latest
```

### Cloudflare Pages

Deploy to Cloudflare Pages:

```bash
npm run cf:deploy
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the terms of the license included in the repository.

---

Happy building with ShipAny! 🚀
