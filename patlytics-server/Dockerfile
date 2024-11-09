# Build stage
FROM node:22-alpine AS builder

# Set working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install dependencies including nest cli
RUN npm ci

# Build the application and remove extraneous packages
RUN npm run build && npm prune --production

# Production stage
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy built application from builder stage
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules

# Expose the port the app runs on
EXPOSE 5438

# Start the server using production build
CMD ["node", "dist/main"]
