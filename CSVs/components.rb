@header =<<HEAD
<?xml version="1.0"?>
<rdf:RDF xmlns="https://w3id.org/ovama-proms#"
     xml:base="https://w3id.org/ovama-proms#"
     xmlns:dc="http://purl.org/dc/elements/1.1/"
     xmlns:owl="http://www.w3.org/2002/07/owl#"
     xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     xmlns:xml="http://www.w3.org/XML/1998/namespace"
     xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
     xmlns:cito="http://purl.org/spar/cito/"
     xmlns:dcat="http://www.w3.org/ns/dcat#"
     xmlns:foaf="http://xmlns.com/foaf/0.1/"
     xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
     xmlns:skos="http://www.w3.org/2004/02/skos/core#"
     xmlns:vann="http://purl.org/vocab/vann/"
     xmlns:void="http://rdfs.org/ns/void#"
     xmlns:terms="http://purl.org/dc/terms/"
     xmlns:schema="http://schema.org/"
     xmlns:protege="http://protege.stanford.edu/plugins/owl/protege#"
     xmlns:resource="http://semanticscience.org/resource/">
    <owl:Ontology rdf:about="https://w3id.org/ovama-proms">
        <owl:imports rdf:resource="http://semanticscience.org/ontology/sio/v1.51/sio-release.owl"/>
        <owl:imports rdf:resource="http://www.w3.org/2004/02/skos/core"/>
        <rdfs:comment xml:lang="en">An ontology for the OVAMA Questionnaire</rdfs:comment>
        <rdfs:label xml:lang="en">OVAMA PROMs</rdfs:label>
    </owl:Ontology>
    


    <!-- 
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // Annotation properties
    //
    ///////////////////////////////////////////////////////////////////////////////////////
     -->

    


    <!-- http://www.w3.org/2000/01/rdf-schema#seeAlso -->

    <owl:AnnotationProperty rdf:about="http://www.w3.org/2000/01/rdf-schema#seeAlso"/>
    


    <!-- http://www.w3.org/ns/dcat#theme -->

    <owl:AnnotationProperty rdf:about="http://www.w3.org/ns/dcat#theme"/>
    


    <!-- 
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // Classes
    //
    ///////////////////////////////////////////////////////////////////////////////////////
     -->
     
    <!-- https://w3id.org/ovama-proms#prom-question -->

    <owl:Class rdf:about="https://w3id.org/ovama-proms#prom-question">
        <rdfs:subClassOf rdf:resource="http://semanticscience.org/resource/SIO_000171"/>
        <dc:description xml:lang="en">OVAMA PROM Question</dc:description>
        <dc:identifier>ovama:prom-question</dc:identifier>
        <rdfs:label xml:lang="en">OVAMA PROM Question</rdfs:label>
    </owl:Class>



HEAD


@section =<<NEWSECTION

    <!-- https://w3id.org/ovama-proms#TERMID -->

    <owl:Class rdf:about="https://w3id.org/ovama-proms#TERMID">
        <rdfs:subClassOf rdf:resource="http://semanticscience.org/resource/SIO_000171"/>
        <dc:description xml:lang="en">DESCRIPTION</dc:description>
        <dc:identifier>QNAME</dc:identifier>
        <rdfs:label xml:lang="en">LABEL</rdfs:label>
    </owl:Class>

NEWSECTION


@clause =<<NEWCLAUSE

    <!-- https://w3id.org/ovama-proms#TERMID -->

    <owl:Class rdf:about="https://w3id.org/ovama-proms#TERMID">
        <rdfs:subClassOf rdf:resource="https://w3id.org/ovama-proms#prom-question"/>
        <dc:description xml:lang="en">DESCRIPTION</dc:description>
        <dc:identifier>QNAME</dc:identifier>
        <rdfs:label xml:lang="en">LABEL</rdfs:label>
        THEMES
    </owl:Class>

NEWCLAUSE


@theme=<<THEME
        <dcat:theme rdf:resource="THEME"/>
THEME


@promid=<<PROMID
        <rdf:Description rdf:about="https://w3id.org/ovama-proms#TERMID"/>
PROMID


@restriction=<<RESTRICTION

    <owl:Class rdf:about="https://w3id.org/ovama-proms#SECTION">
        <owl:equivalentClass>
            <owl:Restriction>
                <owl:onProperty rdf:resource="http://semanticscience.org/resource/SIO_000028"/>
                <owl:someValuesFrom>
                    <owl:Class>
                        <owl:unionOf rdf:parseType="Collection">
                        UNIONLIST
                        </owl:unionOf>
                    </owl:Class>
                </owl:someValuesFrom>
            </owl:Restriction>
        </owl:equivalentClass>
        <owl:equivalentClass>
            <owl:Restriction>
                <owl:onProperty rdf:resource="http://semanticscience.org/resource/SIO_000028"/>
                <owl:allValuesFrom>
                    <owl:Class>
                        <owl:unionOf rdf:parseType="Collection">
                        UNIONLIST
                        </owl:unionOf>
                    </owl:Class>
                </owl:allValuesFrom>
            </owl:Restriction>
        </owl:equivalentClass>
        <rdfs:subClassOf rdf:resource="http://semanticscience.org/resource/SIO_000171"/>
    </owl:Class>
    
RESTRICTION

@skos =<<SKOS

    <owl:NamedIndividual rdf:about="CONCEPT">
        <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
        <skos:prefLabel>CLABEL</skos:prefLabel>
    </owl:NamedIndividual>
    
SKOS

@footer = "</rdf:RDF>"