# --- Build stage ---
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

COPY gradlew ./
COPY gradle gradle
RUN chmod +x gradlew

COPY build.gradle settings.gradle ./
RUN ./gradlew --no-daemon --stacktrace help >/dev/null 2>&1 || true

COPY . .
RUN ./gradlew clean bootJar -x test --no-daemon --stacktrace

# --- Runtime stage ---
FROM eclipse-temurin:21-jre
WORKDIR /app

ENV APP_UPLOAD_DIR=/app/uploads \
    APP_DATA_DIR=/app/data \
    JAVA_OPTS=""

# Crée les dossiers dans l'image runtime
RUN mkdir -p "$APP_UPLOAD_DIR" "$APP_DATA_DIR"

# Copie les images seed du repo dans l'image
COPY src/main/resources/uploads/ "$APP_UPLOAD_DIR"/

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

CMD ["sh","-lc","mkdir -p \"$APP_UPLOAD_DIR\" \"$APP_DATA_DIR\" && exec java $JAVA_OPTS -Dserver.port=${PORT:-8080} -jar /app/app.jar"]
