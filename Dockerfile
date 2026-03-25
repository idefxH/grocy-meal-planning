# Stage 1: Build the Angular app
FROM node:22-alpine AS build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npx ng build --configuration production

# Stage 2: Serve with nginx (multi-arch: amd64 + arm64)
FROM nginx:alpine

COPY --from=build /app/dist/grocy-meal-planning/browser /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
