
FROM sphinxdoc/sphinx:5.3.0

RUN pip install sphinx-rtd-theme sphinxcontrib-bibtex pygments myst-parser
