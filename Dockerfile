# --- Build stage ---
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Copie uniquement les fichiers Gradle d'abord pour mieux cacher les deps
COPY gradlew ./
COPY gradle gradle
RUN chmod +x gradlew

# Copie le build script puis résout les deps (meilleur cache)
COPY build.gradle settings.gradle ./
RUN ./gradlew --no-daemon --stacktrace dependencies >/dev/null 2>&1 || true

# Copie le reste du projet
COPY . .

# Build du jar (sans tests) avec logs verbeux pour diagnostiquer si ça casse
RUN ./gradlew clean bootJar -x test --no-daemon --stacktrace

# --- Runtime stage ---
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copie le jar (adapter si ton jar n'est pas *SNAPSHOT)
COPY --from=build /app/build/libs/*.jar app.jar

# Render fournit PORT ; expose pas nécessaire mais ok en local
EXPOSE 8080
ENV JAVA_OPTS=""
CMD sh -c "java $JAVA_OPTS -Dserver.port=${PORT:-8080} -jar /app/app.jar"
