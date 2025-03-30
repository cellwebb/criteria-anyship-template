# Contributing to Criteria Template

Thank you for your interest in contributing to the Criteria Next.js Template! This document provides guidelines and instructions for contributing.

## 📑 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Documentation](#documentation)

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md) to foster an inclusive and respectful community.

## Getting Started

To get started with contributing:

1. Fork the repository on GitHub
2. Clone your fork locally:

   ```bash
   git clone https://github.com/your-username/criteria-nextjs-template.git
   cd criteria-nextjs-template
   ```

3. Add the original repository as an upstream remote:

   ```bash
   git remote add upstream https://github.com/criteria/nextjs-template.git
   ```

4. Install dependencies:

   ```bash
   pnpm install
   ```

5. Set up the development environment:

   ```bash
   cp .env.example .env.local
   ```

## Development Workflow

We use a standard Git workflow for contributions:

1. Create a feature branch for your changes:

   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes, following our [coding standards](#coding-standards)

3. Run tests to ensure your changes don't break existing functionality:

   ```bash
   make test
   ```

4. Commit your changes using conventional commit messages:

   ```bash
   git commit -m "feat: add new component"
   ```

   Common prefixes:
   - `feat:` - A new feature
   - `fix:` - A bug fix
   - `docs:` - Documentation changes
   - `style:` - Code style changes (formatting, etc)
   - `refactor:` - Code changes that neither fix bugs nor add features
   - `test:` - Adding or fixing tests
   - `chore:` - Changes to the build process or auxiliary tools

5. Push your changes to your fork:

   ```bash
   git push origin feature/your-feature-name
   ```

6. Create a pull request from your fork to the main repository

## Pull Request Process

1. Ensure your PR includes a clear description of the changes and the value they add
2. Update documentation to reflect any changes
3. Include screenshots for UI changes
4. Make sure all tests pass
5. Address review comments and make requested changes
6. Once approved, your PR will be merged by a maintainer

## Coding Standards

We follow specific coding standards to maintain consistency:

- **TypeScript**: Use TypeScript for all new code
- **React**: Use functional components and hooks
- **Components**: Follow the existing component structure
- **Styling**: Use Tailwind CSS for styling
- **Naming**: Use descriptive, clear names for variables, functions, and components
- **Documentation**: Document complex functions and components

## Testing

All contributions should include appropriate tests:

- Run existing tests before submitting a PR:

  ```bash
  make test
  ```

- Add tests for new features or bug fixes
- For UI components, include basic rendering tests

## Documentation

Good documentation is crucial:

- Update the README.md if you're changing or adding features
- Document complex functions and components with JSDoc comments
- For significant changes, update or add to the TEMPLATE.md documentation
- Include meaningful comments in your code when needed

---

Thank you for contributing to the Criteria Next.js Template!
