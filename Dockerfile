
FROM node:18-alpine As development

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# BUILD FOR PRODUCTION
FROM node:18-alpine As build

WORKDIR /app

COPY package*.json ./

COPY --from=development /app/node_modules ./node_modules

COPY . .

RUN npm run build

ENV NODE_ENV production

RUN npm ci --omit=dev && npm cache clean --force

USER node

# PRODUCTION

FROM node:18-alpine As production

COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist

CMD [ "node", "dist/main.js" ]