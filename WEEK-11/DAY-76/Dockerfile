FROM nginx:alpine
# Install curl for healthcheck
RUN apk --no-cache add curl


# Healthcheck logic: check every 30s, timeout after 3s, and if the check fails, exit with status 1
HEALTHCHECK --interval=30s --timeout=3s \
    CMD  "curl", "-f", "http://localhost/"  || exit 1