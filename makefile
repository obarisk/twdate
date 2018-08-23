doc:
	R -e 'roxygen2::roxygenize()'

build:
	R -e 'devtools::build()'

install:
	R -e 'devtools::install_github("obarisk/twdate")'

clean:
	rm ../twdate_*.tar.gz
