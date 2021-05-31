require 'rest-client'
require './components.rb'
require 'csv'

#http://semanticscience.org/resource/SIO_000171  # documnet component

files = Dir["./*.csv"]

counter = 1
allskos = Hash.new  # holds all SKOS clauses (possibly redundant list)

output = File.open('../ontology/ovama-ontology.owl',  'w')
output.puts @header

files.each do |f|
    puts f
    restrictions = Array.new
    thisrestriction = @restriction.clone
    
    id = sprintf("%05d", counter)
    termid = "OVAMA_#{id}"
    qname = "ovama:#{termid}"

    f =~ /OVAMA_questionnaire\s\-\s(.+)?.csv/
    label = $1
    abort "failed lookup" unless label
    thissection = @section.clone
    thissection = thissection.gsub(/TERMID/, termid)
    thissection = thissection.gsub(/DESCRIPTION/, label)
    thissection = thissection.gsub(/LABEL/, label)
    thissection = thissection.gsub(/QNAME/, qname)
    
    #puts thissection
    output.puts thissection
    
    counter +=1

    # PROMS for each section
    file = File.open(f, 'r') # open CSV
    csv = CSV.parse(file.read, headers: true)
    csv.each do |row|

        hash = row.to_h
        qlabel = hash['question']
        qid = sprintf("%05d", counter)
        qtermid = "OVAMA_#{qid}"
        qqname = "ovama:#{qtermid}"

        thispromid = @promid.gsub(/TERMID/, qtermid)
        puts thispromid
        restrictions << thispromid
        
        allthemes = Array.new
        [
        ["mapping1_url", "mapping1_label"],
        ["mapping2_url", "mapping2_label"],
        ["mapping3_url", "mapping3_label"],
        ["mapping4_url", "mapping4_label"],
        ["mapping5_url", "mapping5_label"]
        ].each do |map,label|
            next unless hash[map]
            puts hash[map], hash[label]
            allthemes << @theme.gsub(/THEME/, hash[map])
            thisskos = @skos.clone
            thisskos.gsub!(/CONCEPT/, hash[map])
            thisskos.gsub!(/CLABEL/, hash[label])
            allskos[hash[map]] = thisskos
        end
        
        thisclause = @clause.clone
        thisclause.gsub!(/TERMID/, qtermid)
        thisclause.gsub!(/DESCRIPTION/, qlabel)
        thisclause.gsub!(/QNAME/, qqname)
        thisclause.gsub!(/LABEL/, qlabel)
        thisclause.gsub!(/THEMES/, allthemes.join("\n"))
        #puts thisclause
        output.puts thisclause
        counter +=1
        
    end
        
    thisrestriction.gsub!(/SECTION/, termid)
    thisrestriction.gsub!(/UNIONLIST/, restrictions.join("\n"))
    #puts thisrestriction
    output.puts thisrestriction

end
output.puts allskos.values.join("\n")

output.puts @footer

output.close