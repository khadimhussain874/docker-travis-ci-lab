# Travis CI Docker Build Troubleshooting Guide

## Common Issues and Solutions

### 1. Docker Build Failures

**Issue**: Docker build fails with "COPY failed" error
**Solution**: Check .dockerignore file and ensure all required files are included

**Issue**: Node.js dependencies installation fails
**Solution**: Ensure package.json and package-lock.json are properly committed

### 2. Test Failures

**Issue**: Tests pass locally but fail in Travis CI
**Solution**: Check environment variables and ensure test database/services are available

**Issue**: Container health check fails
**Solution**: Increase sleep time in before_deploy section or adjust health check timeout

### 3. Docker Hub Push Failures

**Issue**: Authentication failed when pushing to Docker Hub
**Solution**: Verify DOCKER_USERNAME and DOCKER_PASSWORD environment variables in Travis CI settings

**Issue**: Repository not found error
**Solution**: Ensure Docker Hub repository exists and username is correct

### 4. Build Timeout Issues

**Issue**: Build times out during Docker operations
**Solution**: Optimize Dockerfile using multi-stage builds and .dockerignore

### 5. Environment Variable Issues

**Issue**: Environment variables not available in build
**Solution**: Check Travis CI repository settings and ensure variables are properly set
