FROM nginx:alpine

# 1. Clear out default placeholder assets
RUN rm -rf /usr/share/nginx/html/*

# 2. FIRST: Copy your site files into the container
COPY ./html/* /usr/share/nginx/html/

# 3. SECOND: Apply ownership to the files that now exist inside the folder
RUN chown nginx:nginx -R /usr/share/nginx/html
RUN chmod 755 -R /usr/share/nginx/html

EXPOSE 80
CMD ["nginx","-g","daemon off;"]

