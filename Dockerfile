# Use an official Node.js runtime as the base image
FROM node:16

# Create a user and a working directory
RUN useradd -m typescript-app-user

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Change ownership of the files to the non-root user
RUN chown -R typescript-app-user:typescript-app-user /app

# Switch to the non-root user
USER typescript-app-user

# Build the TypeScript code
RUN npm run build

# Expose the port that the app will run on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
