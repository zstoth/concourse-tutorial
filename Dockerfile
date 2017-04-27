FROM alpine:latest

# Add our binary
ADD super_*_linux_amd64 /

# Make our binary exec
RUN chmod +x /super_*_linux_amd64

# expose default port 8080
EXPOSE 8080
