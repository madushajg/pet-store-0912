# Use the official Golang base image with a specific version.
FROM golang:1.21

# Set the working directory inside the container.
WORKDIR /app

# Copy your Go source code into the container.
COPY . .

# Build the Go application inside the container.
RUN go build -o hello-world

# Expose the port that your Go service will listen on.
EXPOSE 8080

# Set the user to the newly created non-root user
USER 10001

# Define the command to run your Go service when the container starts.
CMD ["./hello-world"]
