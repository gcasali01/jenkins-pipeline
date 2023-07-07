# Use the official Go image as the base image
FROM golang:alpine3.18

# Set the working directory inside the container
WORKDIR /app

# Copy the source code to the container's working directory
COPY . .

# Build the Go application
RUN go build -o go-app .

# Set the entry point of the container
ENTRYPOINT ["./go-app"]
