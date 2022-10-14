
FROM sphinxdoc/sphinx:5.2.2

RUN pip install sphinx-rtd-theme sphinxcontrib-bibtex pygments myst-parser
