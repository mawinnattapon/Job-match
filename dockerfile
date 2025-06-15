# Multi-stage build for production
FROM node:22-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (including dev dependencies for build)
RUN npm ci --only=production=false

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Production stage
FROM node:22-alpine AS production

# Create app directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production && npm cache clean --force

# Copy built application from builder stage (Nuxt 3 puts everything in .output)
COPY --from=builder /app/.output ./.output

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nuxtjs -u 1001

# Change ownership of the app directory
RUN chown -R nuxtjs:nodejs /app
USER nuxtjs

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node --version || exit 1

# Start the application
CMD ["node", ".output/server/index.mjs"]
