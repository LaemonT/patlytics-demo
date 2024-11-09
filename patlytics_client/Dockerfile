# Use the Flutter image as the build stage
FROM ghcr.io/cirruslabs/flutter:3.24.4 AS builder

# Set the working directory
WORKDIR /app

# Enable Flutter web
RUN flutter config --enable-web

# Copy the pubspec files
COPY pubspec.yaml pubspec.lock ./

# Get Flutter packages
RUN flutter pub get

# Copy the rest of the Flutter project
COPY . .

# Build the Flutter web app
RUN flutter build web --release --target=lib/app/main.dart

# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy the built Flutter app to the Nginx HTML directory
COPY --from=builder /app/build/web /usr/share/nginx/html

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for HTTP traffic
EXPOSE 5487

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]