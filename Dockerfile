# Use a lightweight Nginx base image
FROM nginx:alpine

# Remove default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your static website files to Nginx folder
COPY . /usr/share/nginx/html

# Expose port 80 to access the site
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
