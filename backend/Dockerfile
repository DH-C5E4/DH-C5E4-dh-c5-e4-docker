FROM maven:3.9.9-eclipse-temurin-21
WORKDIR /app
# Copiamos el pom para cache de dependencias
COPY pom.xml .
RUN mvn dependency:go-offline -B
# Copiamos el código fuente
COPY . .
EXPOSE 8080
CMD ["mvn", "spring-boot:run"]
