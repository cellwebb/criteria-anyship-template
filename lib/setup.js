#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

async function promptQuestion(question) {
  return new Promise(resolve => {
    rl.question(question, answer => {
      resolve(answer);
    });
  });
}

async function setup() {
  console.log('\n🚀 Setting up your Next.js project from ShipAny template...\n');

  // Get project details
  const defaultProjectName = path.basename(process.cwd());
  const projectName = process.argv[2] || await promptQuestion(`Project name (${defaultProjectName}): `) || defaultProjectName;
  const projectDescription = await promptQuestion('Project description: ') || `${projectName} - Created from ShipAny Next.js Template`;
  
  const includeAuth = (await promptQuestion('Include authentication? (Y/n): ') || 'Y').toLowerCase() === 'y';
  const includeI18n = (await promptQuestion('Include internationalization? (Y/n): ') || 'Y').toLowerCase() === 'y';
  const includePayment = (await promptQuestion('Include Stripe payment integration? (Y/n): ') || 'Y').toLowerCase() === 'y';

  // Template-specific files to remove
  const filesToRemove = [
    'TEMPLATE.md',
    'lib/setup.js',
    'template.config.ts',
  ];

  // Clean up template-specific files
  filesToRemove.forEach(file => {
    try {
      fs.unlinkSync(path.join(process.cwd(), file));
      console.log(`✅ Removed ${file}`);
    } catch (err) {
      // Ignore if file doesn't exist
    }
  });

  // Update package.json
  const packageJsonPath = path.join(process.cwd(), 'package.json');
  const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, 'utf8'));

  packageJson.name = projectName;
  packageJson.version = '0.1.0';
  packageJson.description = projectDescription;
  delete packageJson.scripts.setup;

  fs.writeFileSync(packageJsonPath, JSON.stringify(packageJson, null, 2));
  console.log('✅ Updated package.json');

  // Update .env.local from .env.example
  try {
    const envExamplePath = path.join(process.cwd(), '.env.example');
    const envLocalPath = path.join(process.cwd(), '.env.local');
    
    if (fs.existsSync(envExamplePath) && !fs.existsSync(envLocalPath)) {
      fs.copyFileSync(envExamplePath, envLocalPath);
      console.log('✅ Created .env.local from .env.example');
    }
  } catch (err) {
    console.error('⚠️ Failed to create .env.local:', err.message);
  }

  // Conditionally remove feature-specific directories/files
  if (!includeAuth) {
    try {
      execSync('rm -rf auth/');
      console.log('✅ Removed authentication features');
    } catch (err) {
      console.error('⚠️ Failed to remove auth directory:', err.message);
    }
  }

  if (!includeI18n) {
    try {
      execSync('rm -rf i18n/');
      execSync('rm -f middleware.ts');
      console.log('✅ Removed internationalization features');
    } catch (err) {
      console.error('⚠️ Failed to remove i18n features:', err.message);
    }
  }

  if (!includePayment) {
    try {
      execSync('rm -rf app/api/stripe/');
      console.log('✅ Removed payment features');
    } catch (err) {
      console.error('⚠️ Failed to remove payment features:', err.message);
    }
  }

  // Initialize git repo if not already initialized
  try {
    if (!fs.existsSync(path.join(process.cwd(), '.git'))) {
      execSync('git init');
      console.log('✅ Initialized git repository');
    }
  } catch (err) {
    console.error('⚠️ Failed to initialize git repository:', err.message);
  }

  console.log(`
✅ ${projectName} has been successfully set up!

🚀 Next steps:
  1. Edit .env.local with your configuration
  2. Install dependencies:
     pnpm install (or npm install)
  3. Start the development server:
     pnpm dev (or npm run dev)

Happy coding! 🎉
`);

  rl.close();
}

setup().catch(err => {
  console.error('❌ Setup failed:', err);
  process.exit(1);
}); 