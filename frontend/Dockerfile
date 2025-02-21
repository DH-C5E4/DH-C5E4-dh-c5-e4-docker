FROM node:lts-alpine as build
WORKDIR /app

# Declaramos las variables que se pasarán como build-arg
ARG VITE_API_URL
ARG VITE_CLOUDINARY_CLOUD_NAME
ARG VITE_CLOUDINARY_UPLOAD_PRESET

# Opcionalmente, las seteamos como ENV para usarlas en otros RUN
ENV VITE_API_URL=$VITE_API_URL
ENV VITE_CLOUDINARY_CLOUD_NAME=$VITE_CLOUDINARY_CLOUD_NAME
ENV VITE_CLOUDINARY_UPLOAD_PRESET=$VITE_CLOUDINARY_UPLOAD_PRESET


# Copia el package.json y el lockfile de pnpm (pnpm-lock.yaml)
COPY package.json pnpm-lock.yaml* ./
RUN npm install -g pnpm@8.6.0 && pnpm install
# Copia el resto del código
COPY . .
RUN pnpm run build

### STAGE 2: Run ###
FROM nginx:alpine
ADD ./config/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /var/www/app/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]