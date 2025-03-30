export type TemplateConfig = {
  projectName: string;
  description: string;
  features: {
    auth: boolean;
    i18n: boolean;
    payment: boolean;
  };
  recommendations: {
    envVars: string[];
    packages: string[];
  };
}

const defaultConfig: TemplateConfig = {
  projectName: 'shipany-app',
  description: 'Next.js application created from ShipAny template',
  features: {
    auth: true,
    i18n: true, 
    payment: true
  },
  recommendations: {
    envVars: [
      'NEXT_PUBLIC_APP_URL',
      'NEXTAUTH_URL',
      'NEXTAUTH_SECRET',
      'STRIPE_SECRET_KEY',
      'STRIPE_WEBHOOK_SECRET'
    ],
    packages: [
      'next-auth',
      'next-intl',
      'stripe',
      'shadcn/ui',
      'sonner'
    ]
  }
};

export default defaultConfig; 