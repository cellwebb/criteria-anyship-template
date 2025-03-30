# Criteria Template Makefile

.PHONY: help install dev build start lint test test-markdown test-typescript check-deps security-check clean deploy-vercel deploy-cf

# Default target
help:
	@echo "Available commands:"
	@echo "  make install           - Install dependencies"
	@echo "  make dev               - Start development server"
	@echo "  make build             - Build the project"
	@echo "  make start             - Start production server"
	@echo "  make lint              - Run linters (JavaScript/TypeScript)"
	@echo "  make lint-md           - Run markdown linter"
	@echo "  make lint-md-fix       - Fix markdown linting issues"
	@echo "  make test              - Run all tests"
	@echo "  make test-markdown     - Run markdown linting tests"
	@echo "  make test-typescript   - Run TypeScript type checks"
	@echo "  make check-deps        - Check for outdated dependencies"
	@echo "  make security-check    - Run security vulnerability check"
	@echo "  make clean             - Clean build artifacts"
	@echo "  make deploy-vercel     - Deploy to Vercel"
	@echo "  make deploy-cf         - Deploy to Cloudflare"
	@echo "  make help              - Show this help message"

# Install dependencies
install:
	pnpm install

# Development server
dev:
	pnpm dev

# Build the project
build:
	pnpm build

# Start production server
start:
	pnpm start

# Run linters
lint:
	pnpm lint

# Run markdown linter
lint-md:
	pnpm lint:md

# Fix markdown linting issues
lint-md-fix:
	pnpm lint:md:fix

# Run all tests
test: test-markdown test-typescript
	@echo "All tests completed successfully!"

# Run markdown linting tests
test-markdown:
	./tests/run-markdown-tests.sh

# Run TypeScript type checking
test-typescript:
	./tests/test-typescript.sh

# Check for outdated dependencies
check-deps:
	./tests/check-dependencies.sh

# Run security vulnerability check
security-check:
	./tests/security-check.sh

# Clean build artifacts
clean:
	rm -rf .next
	rm -rf out
	rm -rf node_modules/.cache

# Deploy to Vercel
deploy-vercel:
	vercel deploy --prod

# Deploy to Cloudflare
deploy-cf:
	pnpm cf:deploy 