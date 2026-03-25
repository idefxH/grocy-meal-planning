# Runtime image only — static files are built in CI and passed via build context
FROM nginx:alpine

COPY dist/grocy-meal-planning/browser/ /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
