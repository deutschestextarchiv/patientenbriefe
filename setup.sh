#!/bin/bash

echo "Fetching XML sources ..."
wget --user pat --ask-password https://kaskade.dwds.de/~wiegand/patientenbriefe/tei-sources.tar.bz2 -O tei-sources.tar.bz2 && tar -jxf tei-sources.tar.bz2
echo

echo "Generating JSON document index ..."
for i in data/*; do
  b=`basename "$i" .xml`
  xsltproc --stringparam filename "$b" xslt/list.xsl "$i"
done | \
jq -R -s 'sub("\n$";"") | split("\n") | { "data": map(split("\t")) }' > list.json
echo

echo "Generating HTML files ..."
for i in data/*.xml; do
  b=`basename "$i" .xml`
  echo "  $b ..."
  xsltproc xslt/tei-full.xsl "$i" > html/"$b".html
done
