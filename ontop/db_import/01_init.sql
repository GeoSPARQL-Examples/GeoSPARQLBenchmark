CREATE TABLE geobench.iri_fact (
                                   subject_iri   TEXT NOT NULL,
                                   predicate_iri TEXT NOT NULL,
                                   object_iri    TEXT NOT NULL,
                                   PRIMARY KEY (subject_iri, predicate_iri, object_iri)
);

CREATE TABLE geobench.literal_fact (
                                       subject_iri   TEXT NOT NULL,
                                       predicate_iri TEXT NOT NULL,
                                       lexical_value TEXT NOT NULL,
                                       datatype_iri  TEXT NOT NULL DEFAULT '',
                                       language_tag  TEXT NOT NULL DEFAULT ''
);