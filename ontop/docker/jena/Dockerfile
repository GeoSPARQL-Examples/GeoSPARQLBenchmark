FROM maven:3.9-eclipse-temurin-21 AS build

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

ARG JENA_REF=jena-6.3.0

RUN git clone --depth 1 --branch ${JENA_REF} \
    https://github.com/apache/jena.git /src

WORKDIR /src

# Promote the EPSG data and its Derby engine from test to runtime scope.
RUN for a in sis-embedded-data derby; do \
      sed -i "/<artifactId>$a<\/artifactId>/,/<\/dependency>/s/<scope>test<\/scope>/<scope>runtime<\/scope>/" \
        jena-geosparql/pom.xml; \
    done \
 && grep -n -A4 -E '<artifactId>(sis-embedded-data|derby)</artifactId>' jena-geosparql/pom.xml \
 && ! sed -n '/<artifactId>sis-embedded-data<\/artifactId>/,/<\/dependency>/p;/<artifactId>derby<\/artifactId>/,/<\/dependency>/p' \
      jena-geosparql/pom.xml | grep -q '<scope>test</scope>'

RUN mvn -q -B -Denforcer.skip=true \
    -pl jena-fuseki2/jena-fuseki-geosparql -am \
    -DskipTests -Dmaven.javadoc.skip=true \
    package \
 && cp "$(ls jena-fuseki2/jena-fuseki-geosparql/target/jena-fuseki-geosparql-*.jar \
        | grep -v -e sources -e javadoc -e original | head -1)" /geosparql-fuseki.jar \
 && ls -lh /geosparql-fuseki.jar \
 && jar tf /geosparql-fuseki.jar | grep -m1 'org/apache/derby/iapi/jdbc/EmbeddedDataSourceInterface.class' \
 && jar tf /geosparql-fuseki.jar | grep -m1 'org/apache/sis/resources/embedded/EmbeddedResources.class'

FROM eclipse-temurin:21-jre

COPY --from=build /geosparql-fuseki.jar /geosparql-fuseki.jar

EXPOSE 3030

ENTRYPOINT ["java", "-jar", "/geosparql-fuseki.jar"]