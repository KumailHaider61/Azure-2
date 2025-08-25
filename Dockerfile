# Use official Node.js 22 image
FROM node:22-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first (better cache)
COPY package*.json ./

# Install dependencies
RUN npm install --frozen-lockfile

# Copy all files
COPY . .

# Build Next.js app
RUN npm run build

# Production image
FROM node:22-alpine AS runner
WORKDIR /app

# Copy built assets from builder stage
COPY --from=builder /app ./

# Set environment variable for production
ENV NODE_ENV=production

# Expose port
EXPOSE 3000

# Start Next.js
CMD ["npm", "start"]
