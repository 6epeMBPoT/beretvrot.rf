WEBROOT ?= root

GEN = index.html
FILES = ${GEN} style.css

all: ${GEN}

index.html: index.7
	mandoc -Thtml index.7 -Ostyle=style.css | sed -e '/<head>/a\
		<meta property="og:description" content="Место, где все берут в рот">\
		<meta property="og:site_name" content="беретврот.рф">' > index.html

clean:
	rm -f ${GEN}

install: ${FILES}
	install -d ${WEBROOT}
	install -Cm644 ${FILES} ${WEBROOT}

.PHONY: all clean install
