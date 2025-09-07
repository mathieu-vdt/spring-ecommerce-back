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

# ✅ crée le dossier dans l'image runtime
RUN mkdir -p /app/data

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080
ENV JAVA_OPTS=""
# ✅ recrée le dossier au démarrage (au cas où un volume le masque)
CMD ["sh","-lc","mkdir -p /app/data && exec java $JAVA_OPTS -Dserver.port=${PORT:-8080} -jar /app/app.jar"]
