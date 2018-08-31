# Ngnix CORS Anywhere

Configure Nginx server as a reverse proxy so that inject header `Access-Control-Allow-Origin: '*'` on all responses.

In frontend development, requests from client side Javascript, such as axios.get(targetURL).then(...).catch(...), often 
receive `Failed to load <targetURL>: No 'Access-Control-Allow-Origin' header is present on the requested resource. 
Origin 'http://127.0.0.1:8080' is therefore not allowed access.`

This docker configure a Nginx server, such that when client sent request to `http://nginx-cors-server/cors/<targetURL>`,
the server proxy_pass and proxy_redirect the request to `<targetURL>`, and when the server receive the response from the
`<targetURL>`, the server add header `Access-Control-Allow-Origin: '*'` on the response, and pass it back to client.

```
$ docker run --rm -it -p 80:80 gyang274/nginx-cors:1.0.0

$ curl -H 'Origin: http://192.168.0.1' -I -X GET http://127.0.0.1/cors/https://www.google.com/

$ curl -H 'Origin: http://192.168.0.1' -I -X GET http://127.0.0.1/cors/https://www.google.com/ --verbose

# note: as above, nginx-cors-server is running on localhost, e.g., http://127.0.0.1/, and a request to targetURL 
# https://www.google.com/ is proxy_pass and proxy_redirect by nginx-cors-server, using 
# http://127.0.0.1/cors/https://www.google.com/.
```  
