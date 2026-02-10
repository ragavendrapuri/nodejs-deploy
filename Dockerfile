#pulling base image
FROM node:18-alpine
#setting working directory 
WORKDIR /app
#copying package.json and package-lock.json to the working directory
COPY package*.json package-lock.json ./
#installing dependencies
RUN npm install --production
#copying the rest of the application code to the working directory
COPY . .
#exposing the port on which the application will run
EXPOSE 3000
#starting the application
CMD ["node","app.js"]