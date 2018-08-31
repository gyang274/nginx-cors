FROM nginx

COPY index.html /app/dist/

COPY nginx.conf /etc/nginx/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx-cors.conf /etc/nginx/conf.d/nginx-cors.conf
