# Use OpenJDK as the base image
FROM openjdk:17-slim

# Install dependencies for wget and unzip
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    libgbm1 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install Gradle (the version should match the one you download)
RUN wget https://services.gradle.org/distributions/gradle-8.13-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-8.13-bin.zip && \
    ln -s /opt/gradle/gradle-8.13/bin/gradle /usr/bin/gradle

# Install Playwright
RUN npm install -g playwright

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the contents of the current directory into the working directory of the container
COPY . .

# Run Gradle build (if you are using Gradle) or specify your Java build command
CMD ["./gradlew", "clean", "test"]
