# Use OpenJDK as the base image
FROM openjdk:17-slim

# Install dependencies (wget, curl, unzip, Node.js, and required libraries)
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    ca-certificates \
    libfontconfig1 \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Playwright
RUN npm install -g playwright

# Install Gradle
RUN wget https://services.gradle.org/distributions/gradle-8.13-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-8.13-bin.zip && \
    ln -s /opt/gradle/gradle-8.13/bin/gradle /usr/bin/gradle

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the contents of the current directory into the working directory of the container
COPY . .

# Grant execute permissions to gradlew (the Gradle wrapper script)
RUN chmod +x ./gradlew

# Run Gradle build (if you are using Gradle) or specify your Java build command
CMD ["./gradlew", "clean", "test"]
