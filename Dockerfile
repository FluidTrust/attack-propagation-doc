
FROM sphinxdoc/sphinx:7.1.2

RUN pip install sphinx-rtd-theme sphinxcontrib-bibtex pygments myst-parser
