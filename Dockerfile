FROM node:22-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source
COPY . .

# Build TypeScript
RUN npm run build || echo "Build may have warnings but continuing..."

# Expose port
EXPOSE 4310

# Start command
CMD ["npm", "run", "dev:ui"]
