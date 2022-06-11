# Documenation for the Palladio Attack Propagation Analysis

## Local build

* run `podman build -t build-doc .` to build the container
* run `podman run --rm -it -v $PWD/docs:/docs:z build-doc make html` to build the documentation
* **Note** for docker replace *podman* with *docker*
