# Use OpenJDK as the base image
FROM openjdk:17-slim

# Install dependencies for Playwright and the browser
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    ca-certificates \
    libfontconfig1 \
    libx11-xcb1 \
    libgbm1 \
    libnss3 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    --no-install-recommends \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Chromium directly from the official repository
RUN apt-get update && apt-get install -y chromium

# Install Playwright and its dependencies
RUN npm install -g playwright

# Force install of Playwright browsers (Chromium, WebKit, and Firefox)
RUN npx playwright install --with-deps

# Set the environment variable to specify the browser installation location
ENV PLAYWRIGHT_BROWSERS_PATH=/usr/src/app/.cache/ms-playwright

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the contents of the current directory into the working directory of the container
COPY . .

# Install Gradle (if you are using Gradle)
RUN wget https://services.gradle.org/distributions/gradle-8.13-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-8.13-bin.zip && \
    ln -s /opt/gradle/gradle-8.13/bin/gradle /usr/bin/gradle

# Grant execute permissions to gradlew (the Gradle wrapper script)
RUN chmod +x ./gradlew

# Run Gradle build (if you are using Gradle) or specify your Java build command
CMD ["./gradlew", "clean", "test"]
