-- Explicit property tables; generated from the user-supplied SQL, without changing RDF facts.
BEGIN;
-- Enable PostGIS
CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
CREATE SCHEMA IF NOT EXISTS geobench;
DROP TABLE IF EXISTS geobench.iri_fact CASCADE;
DROP TABLE IF EXISTS geobench.literal_fact CASCADE;
DROP TABLE IF EXISTS geobench.coordinatedimension CASCADE;
DROP TABLE IF EXISTS geobench.dimension CASCADE;
DROP TABLE IF EXISTS geobench.isempty CASCADE;
DROP TABLE IF EXISTS geobench.issimple CASCADE;
DROP TABLE IF EXISTS geobench.spatialdimension CASCADE;
DROP TABLE IF EXISTS geobench.aswkt_crs84 CASCADE;
DROP TABLE IF EXISTS geobench.hasserialization_crs84 CASCADE;
DROP TABLE IF EXISTS geobench.asgml CASCADE;
DROP TABLE IF EXISTS geobench.aswkt_empty_lexical CASCADE;
DROP TABLE IF EXISTS geobench.aswkt_implicit_crs84 CASCADE;
DROP TABLE IF EXISTS geobench.aswkt_epsg3857 CASCADE;

--225 rows in geobench.iri_fact
CREATE TABLE geobench.iri_fact (subject_iri TEXT NOT NULL, predicate_iri TEXT NOT NULL, object_iri TEXT NOT NULL);
INSERT INTO geobench.iri_fact VALUES
                                  ('http://example.org/ApplicationSchema#A', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#AExactGeom'),
                                  ('http://example.org/ApplicationSchema#A', 'http://example.org/ApplicationSchema#hasPointGeometry', 'http://example.org/ApplicationSchema#APointGeom'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#ehContains', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#ehCovers', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#ehEquals', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#ehMeet', 'http://example.org/ApplicationSchema#C'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#ehOverlap', 'http://example.org/ApplicationSchema#D'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#AExactGeom'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#AExactGeom'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#rcc8ec', 'http://example.org/ApplicationSchema#C'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#rcc8eq', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#rcc8ntppi', 'http://example.org/ApplicationSchema#G'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#rcc8po', 'http://example.org/ApplicationSchema#D'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#rcc8tppi', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#sfContains', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#sfEquals', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#sfIntersects', 'http://example.org/ApplicationSchema#D'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#sfOverlaps', 'http://example.org/ApplicationSchema#D'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.opengis.net/ont/geosparql#sfTouches', 'http://example.org/ApplicationSchema#C'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#A', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#AExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#AExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Polygon'),
                                  ('http://example.org/ApplicationSchema#AExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Polygon'),
                                  ('http://example.org/ApplicationSchema#APointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#APointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#APointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#B', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#BExactGeom'),
                                  ('http://example.org/ApplicationSchema#B', 'http://example.org/ApplicationSchema#hasPointGeometry', 'http://example.org/ApplicationSchema#BPointGeom'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#ehCoveredBy', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#ehDisjoint', 'http://example.org/ApplicationSchema#C'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#ehEquals', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#BExactGeom'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#BExactGeom'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#rcc8dc', 'http://example.org/ApplicationSchema#C'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#rcc8eq', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#rcc8tpp', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#sfDisjoint', 'http://example.org/ApplicationSchema#C'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#sfEquals', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.opengis.net/ont/geosparql#sfWithin', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#B', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#BExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#BExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Polygon'),
                                  ('http://example.org/ApplicationSchema#BExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Polygon'),
                                  ('http://example.org/ApplicationSchema#BPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#BPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#BPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#C', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#CExactGeom'),
                                  ('http://example.org/ApplicationSchema#C', 'http://example.org/ApplicationSchema#hasPointGeometry', 'http://example.org/ApplicationSchema#CPointGeom'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.opengis.net/ont/geosparql#ehDisjoint', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.opengis.net/ont/geosparql#ehEquals', 'http://example.org/ApplicationSchema#C'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#CExactGeom'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#CExactGeom'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.opengis.net/ont/geosparql#rcc8dc', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.opengis.net/ont/geosparql#rcc8eq', 'http://example.org/ApplicationSchema#C'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.opengis.net/ont/geosparql#sfDisjoint', 'http://example.org/ApplicationSchema#B'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.opengis.net/ont/geosparql#sfEquals', 'http://example.org/ApplicationSchema#C'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#C', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#CExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#CExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Polygon'),
                                  ('http://example.org/ApplicationSchema#CExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Polygon'),
                                  ('http://example.org/ApplicationSchema#CPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#CPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#CPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#D', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#DExactGeom'),
                                  ('http://example.org/ApplicationSchema#D', 'http://example.org/ApplicationSchema#hasPointGeometry', 'http://example.org/ApplicationSchema#DPointGeom'),
                                  ('http://example.org/ApplicationSchema#D', 'http://www.opengis.net/ont/geosparql#ehEquals', 'http://example.org/ApplicationSchema#D'),
                                  ('http://example.org/ApplicationSchema#D', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#DExactGeom'),
                                  ('http://example.org/ApplicationSchema#D', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#DExactGeom'),
                                  ('http://example.org/ApplicationSchema#D', 'http://www.opengis.net/ont/geosparql#rcc8eq', 'http://example.org/ApplicationSchema#D'),
                                  ('http://example.org/ApplicationSchema#D', 'http://www.opengis.net/ont/geosparql#sfEquals', 'http://example.org/ApplicationSchema#D'),
                                  ('http://example.org/ApplicationSchema#D', 'http://www.opengis.net/ont/geosparql#sfIntersects', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#D', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#D', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#D', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#DExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#DExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Polygon'),
                                  ('http://example.org/ApplicationSchema#DExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Polygon'),
                                  ('http://example.org/ApplicationSchema#DPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#DPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#DPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#E', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#EExactGeom'),
                                  ('http://example.org/ApplicationSchema#E', 'http://www.opengis.net/ont/geosparql#ehEquals', 'http://example.org/ApplicationSchema#E'),
                                  ('http://example.org/ApplicationSchema#E', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#EExactGeom'),
                                  ('http://example.org/ApplicationSchema#E', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#EExactGeom'),
                                  ('http://example.org/ApplicationSchema#E', 'http://www.opengis.net/ont/geosparql#rcc8eq', 'http://example.org/ApplicationSchema#E'),
                                  ('http://example.org/ApplicationSchema#E', 'http://www.opengis.net/ont/geosparql#sfCrosses', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#E', 'http://www.opengis.net/ont/geosparql#sfEquals', 'http://example.org/ApplicationSchema#E'),
                                  ('http://example.org/ApplicationSchema#E', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#E', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#E', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#EExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#EExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#LineString'),
                                  ('http://example.org/ApplicationSchema#EExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#LineString'),
                                  ('http://example.org/ApplicationSchema#F', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#FExactGeom'),
                                  ('http://example.org/ApplicationSchema#F', 'http://www.opengis.net/ont/geosparql#ehEquals', 'http://example.org/ApplicationSchema#F'),
                                  ('http://example.org/ApplicationSchema#F', 'http://www.opengis.net/ont/geosparql#ehInside', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#F', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#FExactGeom'),
                                  ('http://example.org/ApplicationSchema#F', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#FExactGeom'),
                                  ('http://example.org/ApplicationSchema#F', 'http://www.opengis.net/ont/geosparql#rcc8eq', 'http://example.org/ApplicationSchema#F'),
                                  ('http://example.org/ApplicationSchema#F', 'http://www.opengis.net/ont/geosparql#sfEquals', 'http://example.org/ApplicationSchema#F'),
                                  ('http://example.org/ApplicationSchema#F', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#F', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#F', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#FExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#FExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#FExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#G', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#GExactGeom'),
                                  ('http://example.org/ApplicationSchema#G', 'http://example.org/ApplicationSchema#hasPointGeometry', 'http://example.org/ApplicationSchema#GPointGeom'),
                                  ('http://example.org/ApplicationSchema#G', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#GExactGeom'),
                                  ('http://example.org/ApplicationSchema#G', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#GExactGeom'),
                                  ('http://example.org/ApplicationSchema#G', 'http://www.opengis.net/ont/geosparql#rcc8ntpp', 'http://example.org/ApplicationSchema#A'),
                                  ('http://example.org/ApplicationSchema#G', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#G', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#G', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#GExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#GExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Polygon'),
                                  ('http://example.org/ApplicationSchema#GExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Polygon'),
                                  ('http://example.org/ApplicationSchema#GPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#GPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#GPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#H', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#HExactGeom'),
                                  ('http://example.org/ApplicationSchema#H', 'http://example.org/ApplicationSchema#hasPointGeometry', 'http://example.org/ApplicationSchema#HPointGeom'),
                                  ('http://example.org/ApplicationSchema#H', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#HExactGeom'),
                                  ('http://example.org/ApplicationSchema#H', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#HExactGeom'),
                                  ('http://example.org/ApplicationSchema#H', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#H', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#H', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#HExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#HExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#LineString'),
                                  ('http://example.org/ApplicationSchema#HExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#LineString'),
                                  ('http://example.org/ApplicationSchema#HPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#HPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#HPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#I', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#IExactGeom'),
                                  ('http://example.org/ApplicationSchema#I', 'http://example.org/ApplicationSchema#hasPointGeometry', 'http://example.org/ApplicationSchema#IPointGeom'),
                                  ('http://example.org/ApplicationSchema#I', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#IExactGeom'),
                                  ('http://example.org/ApplicationSchema#I', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#IExactGeom'),
                                  ('http://example.org/ApplicationSchema#I', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#I', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#I', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#IExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#IExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#LineString'),
                                  ('http://example.org/ApplicationSchema#IExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#LineString'),
                                  ('http://example.org/ApplicationSchema#IPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#IPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#IPointGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#J', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#JExactGeom'),
                                  ('http://example.org/ApplicationSchema#J', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#JExactGeom'),
                                  ('http://example.org/ApplicationSchema#J', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#JExactGeom'),
                                  ('http://example.org/ApplicationSchema#J', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#J', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#J', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#JExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#JExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Polygon'),
                                  ('http://example.org/ApplicationSchema#JExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Polygon'),
                                  ('http://example.org/ApplicationSchema#K', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#KExactGeom'),
                                  ('http://example.org/ApplicationSchema#K', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#KExactGeom'),
                                  ('http://example.org/ApplicationSchema#K', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#KExactGeom'),
                                  ('http://example.org/ApplicationSchema#K', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#K', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#K', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#KExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#KExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Polygon'),
                                  ('http://example.org/ApplicationSchema#KExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Polygon'),
                                  ('http://example.org/ApplicationSchema#L', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#LExactGeom'),
                                  ('http://example.org/ApplicationSchema#L', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#LExactGeom'),
                                  ('http://example.org/ApplicationSchema#L', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#LExactGeom'),
                                  ('http://example.org/ApplicationSchema#L', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#L', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#L', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#LExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#LExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#LExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#M', 'http://example.org/ApplicationSchema#hasExactGeometry', 'http://example.org/ApplicationSchema#MExactGeom'),
                                  ('http://example.org/ApplicationSchema#M', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.org/ApplicationSchema#PlaceOfInterest'),
                                  ('http://example.org/ApplicationSchema#M', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#SpatialObject'),
                                  ('http://example.org/ApplicationSchema#MExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#MExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/gml#Point'),
                                  ('http://example.org/ApplicationSchema#MExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/sf#Point'),
                                  ('http://example.org/ApplicationSchema#N', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#NExactGeom'),
                                  ('http://example.org/ApplicationSchema#N', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#NExactGeom'),
                                  ('http://example.org/ApplicationSchema#N', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#NExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#O', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#OExactGeom'),
                                  ('http://example.org/ApplicationSchema#O', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#OExactGeom'),
                                  ('http://example.org/ApplicationSchema#O', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#OExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#P', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#PExactGeom'),
                                  ('http://example.org/ApplicationSchema#P', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#PExactGeom'),
                                  ('http://example.org/ApplicationSchema#P', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#PExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#Q', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#QExactGeom'),
                                  ('http://example.org/ApplicationSchema#Q', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#QExactGeom'),
                                  ('http://example.org/ApplicationSchema#Q', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#QExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#R', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#RExactGeom'),
                                  ('http://example.org/ApplicationSchema#R', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#RExactGeom'),
                                  ('http://example.org/ApplicationSchema#R', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#RExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#S', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#SExactGeom'),
                                  ('http://example.org/ApplicationSchema#S', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#SExactGeom'),
                                  ('http://example.org/ApplicationSchema#S', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#SExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#T', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#TExactGeom'),
                                  ('http://example.org/ApplicationSchema#T', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#TExactGeom'),
                                  ('http://example.org/ApplicationSchema#T', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#TExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#U', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#UExactGeom'),
                                  ('http://example.org/ApplicationSchema#U', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#UExactGeom'),
                                  ('http://example.org/ApplicationSchema#U', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#UExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#V', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#VExactGeom'),
                                  ('http://example.org/ApplicationSchema#V', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#VExactGeom'),
                                  ('http://example.org/ApplicationSchema#V', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#VExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry'),
                                  ('http://example.org/ApplicationSchema#W', 'http://www.opengis.net/ont/geosparql#hasDefaultGeometry', 'http://example.org/ApplicationSchema#WExactGeom'),
                                  ('http://example.org/ApplicationSchema#W', 'http://www.opengis.net/ont/geosparql#hasGeometry', 'http://example.org/ApplicationSchema#WExactGeom'),
                                  ('http://example.org/ApplicationSchema#W', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Feature'),
                                  ('http://example.org/ApplicationSchema#WExactGeom', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://www.opengis.net/ont/geosparql#Geometry');

CREATE TABLE geobench.coordinatedimension (subject_iri TEXT NOT NULL, value INTEGER NOT NULL);
INSERT INTO geobench.coordinatedimension (subject_iri,value) VALUES
  ('http://example.org/ApplicationSchema#AExactGeom', 2),
  ('http://example.org/ApplicationSchema#APointGeom', 2),
  ('http://example.org/ApplicationSchema#BExactGeom', 2),
  ('http://example.org/ApplicationSchema#BPointGeom', 2),
  ('http://example.org/ApplicationSchema#CExactGeom', 2),
  ('http://example.org/ApplicationSchema#CPointGeom', 2),
  ('http://example.org/ApplicationSchema#DExactGeom', 2),
  ('http://example.org/ApplicationSchema#DPointGeom', 2),
  ('http://example.org/ApplicationSchema#EExactGeom', 2),
  ('http://example.org/ApplicationSchema#FExactGeom', 2),
  ('http://example.org/ApplicationSchema#GExactGeom', 2),
  ('http://example.org/ApplicationSchema#GPointGeom', 2),
  ('http://example.org/ApplicationSchema#HExactGeom', 2),
  ('http://example.org/ApplicationSchema#HPointGeom', 2),
  ('http://example.org/ApplicationSchema#IExactGeom', 2),
  ('http://example.org/ApplicationSchema#IPointGeom', 2),
  ('http://example.org/ApplicationSchema#JExactGeom', 2),
  ('http://example.org/ApplicationSchema#KExactGeom', 2),
  ('http://example.org/ApplicationSchema#LExactGeom', 2),
  ('http://example.org/ApplicationSchema#MExactGeom', 2);
CREATE TABLE geobench.dimension (subject_iri TEXT NOT NULL, value INTEGER NOT NULL);
INSERT INTO geobench.dimension (subject_iri,value) VALUES
  ('http://example.org/ApplicationSchema#AExactGeom', 2),
  ('http://example.org/ApplicationSchema#APointGeom', 2),
  ('http://example.org/ApplicationSchema#BExactGeom', 2),
  ('http://example.org/ApplicationSchema#CExactGeom', 2),
  ('http://example.org/ApplicationSchema#CPointGeom', 2),
  ('http://example.org/ApplicationSchema#DExactGeom', 2),
  ('http://example.org/ApplicationSchema#DPointGeom', 2),
  ('http://example.org/ApplicationSchema#EExactGeom', 2),
  ('http://example.org/ApplicationSchema#FExactGeom', 2),
  ('http://example.org/ApplicationSchema#GExactGeom', 2),
  ('http://example.org/ApplicationSchema#GPointGeom', 2),
  ('http://example.org/ApplicationSchema#HExactGeom', 2),
  ('http://example.org/ApplicationSchema#HPointGeom', 2),
  ('http://example.org/ApplicationSchema#IExactGeom', 2),
  ('http://example.org/ApplicationSchema#IPointGeom', 2),
  ('http://example.org/ApplicationSchema#JExactGeom', 2),
  ('http://example.org/ApplicationSchema#KExactGeom', 2),
  ('http://example.org/ApplicationSchema#LExactGeom', 2),
  ('http://example.org/ApplicationSchema#MExactGeom', 2);
CREATE TABLE geobench.isempty (subject_iri TEXT NOT NULL, value BOOLEAN NOT NULL);
INSERT INTO geobench.isempty (subject_iri,value) VALUES
  ('http://example.org/ApplicationSchema#AExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#APointGeom', FALSE),
  ('http://example.org/ApplicationSchema#BExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#BPointGeom', FALSE),
  ('http://example.org/ApplicationSchema#CExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#CPointGeom', FALSE),
  ('http://example.org/ApplicationSchema#DExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#DPointGeom', FALSE),
  ('http://example.org/ApplicationSchema#EExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#FExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#GExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#GPointGeom', FALSE),
  ('http://example.org/ApplicationSchema#HExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#HPointGeom', TRUE),
  ('http://example.org/ApplicationSchema#IExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#IPointGeom', TRUE),
  ('http://example.org/ApplicationSchema#JExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#KExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#LExactGeom', FALSE),
  ('http://example.org/ApplicationSchema#MExactGeom', FALSE);
CREATE TABLE geobench.issimple (subject_iri TEXT NOT NULL, value BOOLEAN NOT NULL);
INSERT INTO geobench.issimple (subject_iri,value) VALUES
  ('http://example.org/ApplicationSchema#AExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#APointGeom', TRUE),
  ('http://example.org/ApplicationSchema#BExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#BPointGeom', TRUE),
  ('http://example.org/ApplicationSchema#CExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#CPointGeom', TRUE),
  ('http://example.org/ApplicationSchema#DExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#DPointGeom', TRUE),
  ('http://example.org/ApplicationSchema#EExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#FExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#GExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#GPointGeom', TRUE),
  ('http://example.org/ApplicationSchema#HExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#HPointGeom', TRUE),
  ('http://example.org/ApplicationSchema#IExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#IPointGeom', TRUE),
  ('http://example.org/ApplicationSchema#JExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#KExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#LExactGeom', TRUE),
  ('http://example.org/ApplicationSchema#MExactGeom', TRUE);
CREATE TABLE geobench.spatialdimension (subject_iri TEXT NOT NULL, value INTEGER NOT NULL);
INSERT INTO geobench.spatialdimension (subject_iri,value) VALUES
  ('http://example.org/ApplicationSchema#AExactGeom', 2),
  ('http://example.org/ApplicationSchema#APointGeom', 2),
  ('http://example.org/ApplicationSchema#BExactGeom', 2),
  ('http://example.org/ApplicationSchema#BPointGeom', 2),
  ('http://example.org/ApplicationSchema#CExactGeom', 2),
  ('http://example.org/ApplicationSchema#CPointGeom', 2),
  ('http://example.org/ApplicationSchema#DExactGeom', 2),
  ('http://example.org/ApplicationSchema#DPointGeom', 2),
  ('http://example.org/ApplicationSchema#EExactGeom', 2),
  ('http://example.org/ApplicationSchema#FExactGeom', 2),
  ('http://example.org/ApplicationSchema#GExactGeom', 2),
  ('http://example.org/ApplicationSchema#GPointGeom', 2),
  ('http://example.org/ApplicationSchema#HExactGeom', 2),
  ('http://example.org/ApplicationSchema#HPointGeom', 2),
  ('http://example.org/ApplicationSchema#IExactGeom', 2),
  ('http://example.org/ApplicationSchema#IPointGeom', 2),
  ('http://example.org/ApplicationSchema#JExactGeom', 2),
  ('http://example.org/ApplicationSchema#KExactGeom', 2),
  ('http://example.org/ApplicationSchema#LExactGeom', 2),
  ('http://example.org/ApplicationSchema#MExactGeom', 2);

CREATE TABLE geobench.aswkt_crs84 (subject_iri TEXT PRIMARY KEY , wkt geometry NOT NULL);
INSERT INTO geobench.aswkt_crs84 (subject_iri,wkt) VALUES
  ('http://example.org/ApplicationSchema#AExactGeom', 'Polygon((-83.6 34.1, -83.2 34.1, -83.2 34.5, -83.6 34.5, -83.6 34.1))'),
  ('http://example.org/ApplicationSchema#APointGeom', 'Point(-83.4 34.3)'),
  ('http://example.org/ApplicationSchema#BExactGeom', 'Polygon((-83.6 34.1, -83.4 34.1, -83.4 34.3, -83.6 34.3, -83.6 34.1))'),
  ('http://example.org/ApplicationSchema#BPointGeom', 'Point(-83.5 34.2)'),
  ('http://example.org/ApplicationSchema#CExactGeom', 'Polygon((-83.2 34.3, -83.0 34.3, -83.0 34.5, -83.2 34.5, -83.2 34.3))'),
  ('http://example.org/ApplicationSchema#CPointGeom', 'Point(-83.1 34.4)'),
  ('http://example.org/ApplicationSchema#DExactGeom', 'Polygon((-83.3 34.0, -83.1 34.0, -83.1 34.2, -83.3 34.2, -83.3 34.0))'),
  ('http://example.org/ApplicationSchema#DPointGeom', 'Point(-83.2 34.1)'),
  ('http://example.org/ApplicationSchema#EExactGeom', 'LineString(-83.4 34.0, -83.3 34.3)'),
  ('http://example.org/ApplicationSchema#FExactGeom', 'Point(-83.4 34.4)'),
  ('http://example.org/ApplicationSchema#GExactGeom', 'Polygon((-83.5 34.2, -83.3 34.2, -83.3 34.4, -83.5 34.4, -83.5 34.2))'),
  ('http://example.org/ApplicationSchema#GPointGeom', 'Point(-83.4 34.3)'),
  ('http://example.org/ApplicationSchema#JExactGeom', 'Polygon((-77.089005 38.913574,-77.029953 38.913574,-77.029953 38.886321,-77.089005 38.886321,-77.089005 38.913574))'),
  ('http://example.org/ApplicationSchema#KExactGeom', 'Polygon((-77.089005 38.913574,-77.029953 38.913574,-77.029953 38.886321,-77.089005 38.886321,-77.089005 38.913574))'),
  ('http://example.org/ApplicationSchema#LExactGeom', 'Point(-88.38 31.95)'),
  ('http://example.org/ApplicationSchema#MExactGeom', 'Point(31.95 -88.38)');

CREATE TABLE geobench.aswkt_epsg3857 (subject_iri TEXT PRIMARY KEY , wkt geometry NOT NULL);
INSERT INTO geobench.aswkt_epsg3857 (subject_iri,wkt) VALUES
  ('http://example.org/ApplicationSchema#NExactGeom', 'POINT Z (2 3 7)'),
  ('http://example.org/ApplicationSchema#OExactGeom', 'LINESTRING Z (0 0 2, 3 4 9)'),
  ('http://example.org/ApplicationSchema#PExactGeom', 'MULTIPOINT ((0 0),(3 4))'),
  ('http://example.org/ApplicationSchema#QExactGeom', 'POLYGON ((0 0,10 0,10 10,0 10,0 0))'),
  ('http://example.org/ApplicationSchema#RExactGeom', 'POINT (0 0)'),
  ('http://example.org/ApplicationSchema#SExactGeom', 'POINT (3 4)'),
  ('http://example.org/ApplicationSchema#TExactGeom', 'LINESTRING (0 0,3 4)'),
  ('http://example.org/ApplicationSchema#UExactGeom', 'POLYGON ((0 0,4 0,4 4,2 2,0 4,0 0))'),
  ('http://example.org/ApplicationSchema#VExactGeom', 'POINT M (1 2 5)'),
  ('http://example.org/ApplicationSchema#WExactGeom', 'MULTIPOLYGON (((0 0,2 0,2 2,0 2,0 0)),((4 0,6 0,6 2,4 2,4 0)))');

CREATE TABLE geobench.hasserialization_crs84 (subject_iri TEXT PRIMARY KEY , wkt geometry(Geometry, 4326) NOT NULL);
INSERT INTO geobench.hasserialization_crs84 (subject_iri,wkt) VALUES
  ('http://example.org/ApplicationSchema#AExactGeom', 'Polygon((-83.6 34.1, -83.2 34.1, -83.2 34.5, -83.6 34.5, -83.6 34.1))');

CREATE TABLE geobench.asgml (subject_iri TEXT PRIMARY KEY , gml TEXT NOT NULL);
INSERT INTO geobench.asgml (subject_iri,gml) VALUES
  ('http://example.org/ApplicationSchema#AExactGeom', '<gml:Polygon xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:exterior><gml:LinearRing><gml:posList>-83.6 34.1 -83.2 34.1 -83.2 34.5 -83.6 34.5 -83.6 34.1</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>'),
  ('http://example.org/ApplicationSchema#APointGeom', '<gml:Point xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:pos>-83.4 34.3</gml:pos></gml:Point>'),
  ('http://example.org/ApplicationSchema#BExactGeom', '<gml:Polygon xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:exterior><gml:LinearRing><gml:posList>-83.6 34.1 -83.4 34.1 -83.4 34.3 -83.6 34.3 -83.6 34.1</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>'),
  ('http://example.org/ApplicationSchema#BPointGeom', '<gml:Point xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:pos>-83.5 34.2</gml:pos></gml:Point>'),
  ('http://example.org/ApplicationSchema#CExactGeom', '<gml:Polygon xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:exterior><gml:LinearRing><gml:posList>-83.2 34.3 -83.0 34.3 -83.0 34.5 -83.2 34.5 -83.2 34.3</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>'),
  ('http://example.org/ApplicationSchema#CPointGeom', '<gml:Point xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:pos>-83.1 34.4</gml:pos></gml:Point>'),
  ('http://example.org/ApplicationSchema#DExactGeom', '<gml:Polygon xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:exterior><gml:LinearRing><gml:posList>-83.3 34.0 -83.1 34.0 -83.1 34.2 -83.3 34.2 -83.3 34.0</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>'),
  ('http://example.org/ApplicationSchema#DPointGeom', '<gml:Point xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:pos>-83.2 34.1</gml:pos></gml:Point>'),
  ('http://example.org/ApplicationSchema#EExactGeom', '<gml:LineString srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84" xmlns:gml="http://www.opengis.net/ont/gml"><gml:posList>-83.4 34.0 -83.3 34.3</gml:posList></gml:LineString>'),
  ('http://example.org/ApplicationSchema#FExactGeom', '<gml:Point xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:pos>-83.4 34.4</gml:pos></gml:Point>'),
  ('http://example.org/ApplicationSchema#GExactGeom', '<gml:Polygon xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:exterior><gml:LinearRing><gml:posList>-83.5 34.2 -83.3 34.2 -83.3 34.4 -83.5 34.4 -83.5 34.2</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>'),
  ('http://example.org/ApplicationSchema#GPointGeom', '<gml:Point xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:pos>-83.4 34.3</gml:pos></gml:Point>'),
  ('http://example.org/ApplicationSchema#HExactGeom', ''),
  ('http://example.org/ApplicationSchema#HPointGeom', ''),
  ('http://example.org/ApplicationSchema#IExactGeom', '<LineString xmlns="https://www.opengis.net/gml"><posList></posList></LineString>'),
  ('http://example.org/ApplicationSchema#IPointGeom', '<Point xmlns="https://www.opengis.net/gml"><posList></posList></Point>'),
  ('http://example.org/ApplicationSchema#JExactGeom', '<gml:Polygon xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:exterior><gml:LinearRing><gml:posList>-77.089005 38.913574 -77.029953 38.913574 -77.029953 38.886321 -77.089005 38.886321 -77.089005 38.913574</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>'),
  ('http://example.org/ApplicationSchema#KExactGeom', '<gml:Polygon xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:exterior><gml:LinearRing><gml:posList>-77.089005 38.913574 -77.029953 38.913574 -77.029953 38.886321 -77.089005 38.886321 -77.089005 38.913574</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>'),
  ('http://example.org/ApplicationSchema#LExactGeom', '<gml:Point xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/OGC/1.3/CRS84"><gml:pos>-88.38 31.95</gml:pos></gml:Point>'),
  ('http://example.org/ApplicationSchema#MExactGeom', '<gml:Point xmlns:gml="http://www.opengis.net/ont/gml" srsName="http://www.opengis.net/def/crs/EPSG/0/4326"><gml:pos>31.95 -88.38</gml:pos></gml:Point>');

CREATE TABLE geobench.aswkt_empty_lexical (subject_iri TEXT PRIMARY KEY , wkt TEXT NOT NULL);
INSERT INTO geobench.aswkt_empty_lexical (subject_iri,wkt) VALUES
  ('http://example.org/ApplicationSchema#HExactGeom', ''),
  ('http://example.org/ApplicationSchema#HPointGeom', '');

CREATE TABLE geobench.aswkt_implicit_crs84 (subject_iri TEXT PRIMARY KEY , wkt geometry(Geometry, 4326) NOT NULL);
INSERT INTO geobench.aswkt_implicit_crs84 (subject_iri,wkt) VALUES
  ('http://example.org/ApplicationSchema#IExactGeom', 'LINESTRING EMPTY'),
  ('http://example.org/ApplicationSchema#IPointGeom', 'POINT EMPTY');


-- Generic RDF triples
ALTER TABLE geobench.iri_fact
    ADD CONSTRAINT pk_iri_fact
        PRIMARY KEY (subject_iri, predicate_iri, object_iri);

-- Geometry properties
ALTER TABLE geobench.coordinatedimension
    ADD CONSTRAINT pk_coordinatedimension
        PRIMARY KEY (subject_iri);

ALTER TABLE geobench.dimension
    ADD CONSTRAINT pk_dimension
        PRIMARY KEY (subject_iri);

ALTER TABLE geobench.isempty
    ADD CONSTRAINT pk_isempty
        PRIMARY KEY (subject_iri);

ALTER TABLE geobench.issimple
    ADD CONSTRAINT pk_issimple
        PRIMARY KEY (subject_iri);

ALTER TABLE geobench.spatialdimension
    ADD CONSTRAINT pk_spatialdimension
        PRIMARY KEY (subject_iri);

-- ALTER TABLE geobench.iri_fact_default_geometry
--     ADD CONSTRAINT fk_geometry_all
--         FOREIGN KEY (object_iri)
--             REFERENCES geobench.geometry_all(subject_iri);

COMMIT;
