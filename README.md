# Mockup Patientenbriefe

## Software prerequisites

* [jq](https://stedolan.github.io/jq/)
* [xsltproc](http://xmlsoft.org/xslt/xsltproc.html)

Installation on Debian-like systems (Debian GNU/Linux, Ubuntu, Linux Mint etc.):

```bash
sudo apt install jq xsltproc
```

## Setup instructions 

### Clone repository

```bash
git clone git@github.com:deutschestextarchiv/patientenbriefe.git
cd patientenbriefe
```

To generate all data needed for HTML presentation, just execute

```bash
./setup.sh
```

or do each step manually:

### 1. Grab XML sources

HTTP credentials are provided on request, see *Contact* below.

```
wget --user pat --ask-password https://kaskade.dwds.de/~wiegand/patientenbriefe/tei-sources.tar.bz2 -O tei-sources.tar.bz2 && tar -jxf tei-sources.tar.bz2
```

### 2. Generate a JSON list for all documents

```bash
for i in data/*; do
  b=`basename "$i" .xml`
  xsltproc --stringparam filename "$b" xslt/list.xsl "$i"
done | \
jq -R -s 'sub("\n$";"") | split("\n") | { "data": map(split("\t")) }' > list.json
```

### 3. Generate HTML for all documents

```bash
for i in data/*.xml; do
  b=`basename "$i" .xml`
  xsltproc xslt/tei-full.xsl "$i" > html/"$b".html
done
```

### Webserver setup

You’ll need a webserver. A setup for Apache may look like:

```apacheconf
<Directory /your/path/to/patientenbriefe>
  DirectoryIndex index.html
  Options +Indexes
  Require all granted
</Directory>
Alias /patientenbriefe /your/path/to/patientenbriefe
```

## Contact

Frank Wiegand, <mailto:wiegand@bbaw.de>
