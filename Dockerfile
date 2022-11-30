FROM node:19-bullseye AS builder

RUN mkdir /app
WORKDIR /app

# Copy everything in to /app
COPY . .
RUN rm -rf /app/node_modules
RUN npm install
RUN npm run build


FROM nginx:alpine
COPY index.html /usr/share/nginx/html/
COPY images/ /usr/share/nginx/html/images/
COPY --from=builder /app/dist/ /usr/share/nginx/html/dist/
