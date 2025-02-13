FROM node:lts-alpine
WORKDIR /app
# Copia el package.json y el lockfile de pnpm (pnpm-lock.yaml)
COPY package.json pnpm-lock.yaml* ./
RUN npm install -g pnpm@8.6.0 && pnpm install
# Copia el resto del código
COPY . .
EXPOSE 5173
CMD ["pnpm", "run", "dev"]
