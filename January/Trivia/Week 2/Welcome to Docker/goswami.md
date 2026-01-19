# Welcome to Docker Lab

## Task 1: Hello World
```bash
docker run hello-world
docker images
docker ps -a
```

## Task 2: Build
```bash
mkdir test && cd test

cat > Dockerfile <<EOF
FROM node:lts
WORKDIR /app
ADD . /app
EXPOSE 80
CMD ["node", "app.js"]
EOF

cat > app.js <<EOF
const http = require("http");
const hostname = "0.0.0.0";
const port = 80;
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/plain");
  res.end("Hello World\\n");
});
server.listen(port, hostname, () => {
  console.log("Server running at http://%s:%s/", hostname, port);
});
process.on("SIGINT", function () {
  console.log("Caught interrupt signal and will exit");
  process.exit();
});
EOF

docker build -t node-app:0.1 .
```

## Task 3: Run
```bash
docker run -p 4000:80 --name my-app node-app:0.1
curl http://localhost:4000
docker stop my-app && docker rm my-app
docker run -p 4000:80 --name my-app -d node-app:0.1
docker ps
docker logs [container_id]
```

### Modify Application
```bash
# Edit app.js - change "Hello World" to "Welcome to Cloud"
docker build -t node-app:0.2 .
docker run -p 8080:80 --name my-app-2 -d node-app:0.2
curl http://localhost:8080
```

## Task 4: Debug
```bash
docker logs -f [container_id]
docker exec -it [container_id] bash
docker inspect [container_id]
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' [container_id]
```

## Task 5: Publish
```bash
gcloud artifacts repositories create my-repository --repository-format=docker --location=us-central1 --description="Docker repository"
gcloud auth configure-docker us-central1-docker.pkg.dev

cd ~/test
docker build -t us-central1-docker.pkg.dev/PROJECT_ID/my-repository/node-app:0.2 .
docker push us-central1-docker.pkg.dev/PROJECT_ID/my-repository/node-app:0.2

# Test
docker stop $(docker ps -q)
docker rm $(docker ps -aq)
docker rmi us-central1-docker.pkg.dev/PROJECT_ID/my-repository/node-app:0.2
docker rmi node:lts
docker rmi -f $(docker images -aq)
docker run -p 4000:80 -d us-central1-docker.pkg.dev/PROJECT_ID/my-repository/node-app:0.2
curl http://localhost:4000
```
