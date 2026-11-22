FROM maven:3.9-eclipse-temurin-21 AS build
RUN apt-get update && apt-get install -y --no-install-recommends git && rm -rf /var/lib/apt/lists/*
ARG JENA_REF=jena-6.3.0
RUN git clone --depth 1 --branch ${JENA_REF} https://github.com/apache/jena.git /src
WORKDIR /src
RUN mvn -q -B -pl jena-fuseki2/jena-fuseki-geosparql -am -DskipTests -Dmaven.javadoc.skip=true package \
 && cp "$(ls jena-fuseki2/jena-fuseki-geosparql/target/jena-fuseki-geosparql-*.jar \
      | grep -v -e sources -e javadoc -e original | head -1)" /geosparql-fuseki.jar

FROM eclipse-temurin:21-jre
COPY --from=build /geosparql-fuseki.jar /geosparql-fuseki.jar
EXPOSE 3030
ENTRYPOINT ["java", "-jar", "/geosparql-fuseki.jar"]