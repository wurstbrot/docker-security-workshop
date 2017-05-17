FROM nodesource/jessie:0.12.7
#docker pull nodesource/wheezy:4.3.1

# cahe package.json and node_modules to speed up builds
ADD server.js server.js 
ADD package.json package.json
RUN npm install
# Add your source files
ADD . .
CMD ["npm","start"]
