doc:
	R -e 'roxygen2::roxygenize()'

build:
	R -e 'devtools::build()'

clean:
	rm ../twdate_*.tar.gz
