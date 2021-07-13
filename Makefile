# VERSION / RELEASE
# If no version is specified as a parameter of make, the last git hash
# value is taken.
VERSION?=$(shell git describe --abbrev=0)+hash.$(shell git rev-parse --short HEAD)

# CONTAINER_RUNTIME
# The CONTAINER_RUNTIME variable will be used to specified the path to a
# container runtime. This is needed to start and run a container images.
CONTAINER_RUNTIME?=$(shell which docker)

# BUILD_IMAGE
# Definition of the container build image, in which the BInary are compiled from
# source code
BUILD_IMAGE_REGISTRY:=docker.io
BUILD_IMAGE_NAMESPACE:=volkerraschek
BUILD_IMAGE_NAME:=container-latex
BUILD_IMAGE_VERSION:=latest-archlinux
BUILD_IMAGE_FULL=${BUILD_IMAGE_REGISTRY}/${BUILD_IMAGE_NAMESPACE}/${BUILD_IMAGE_NAME}:${BUILD_IMAGE_VERSION}
BUILD_IMAGE_SHORT=${BUILD_IMAGE_NAMESPACE}/${BUILD_IMAGE_NAME}:${BUILD_IMAGE_VERSION}

# Input tex-file and output pdf-file
FILE_NAME=index
IDX_TARGET:=${FILE_NAME:%=%.idx}
PDF_TARGET:=${FILE_NAME:%=%.pdf}
TEX_TARGET:=${FILE_NAME:%=%.tex}

# PDF_TARGET
# ==============================================================================
${PDF_TARGET}: latexmk/${PDF_TARGET}

PHONY:=latexmk/${PDF_TARGET}
latexmk/${PDF_TARGET}:
	latexmk \
		-shell-escape \
		-synctex=1 \
		-interaction=nonstopmode \
		-file-line-error \
		-pdf ${TEX_TARGET}

PHONY+=pdflatex/${PDF_TARGET}
pdflatex/${PDF_TARGET}:

	makeglossaries ${FILE_NAME}
	makeindex ${FILE_NAME}

	pdflatex \
		-shell-escape \
		-synctex=1 \
		-interaction=nonstopmode \
		-enable-write18 ${TEX_TARGET}

# SCHEMA
# ==============================================================================
destroy-schema:
	./sh/delete-schema.sh

import-model:
	./sh/import-model.sh

execute-solutions:
	./sh/execute-solutions.sh FOLDER=${FOLDER}


# CLEAN
# ==============================================================================
PHONY+=clean
clean:
	git clean -fX

# CONTAINER STEPS - PDF_TARGET
# ==============================================================================
container-run/${PDF_TARGET}:
	$(MAKE) container-run COMMAND=${@:container-run/%=%}

container-run/latexmk/${PDF_TARGET}:
	$(MAKE) container-run COMMAND=${@:container-run/%=%}

container-run/pdflatex/${PDF_TARGET}:
	$(MAKE) container-run COMMAND=${@:container-run/%=%}

# CONTAINER STEPS - CLEAN
# ==============================================================================
container-run/clean:
	$(MAKE) container-run COMMAND=${@:container-run/%=%}

# GENERAL CONTAINER COMMAND
# ==============================================================================
PHONY+=container-run
container-run:
	${CONTAINER_RUNTIME} run \
		--rm \
		--user $(shell id --user):${shell id --group} \
		--volume $(shell pwd):/workspace \
			${BUILD_IMAGE_SHORT} \
				make ${COMMAND} \
					VERSION=${VERSION} \

# PHONY
# ==============================================================================
# Declare the contents of the PHONY variable as phony.  We keep that information
# in a variable so we can use it in if_changed.
.PHONY: ${PHONY}
