# UID/GID
# UID or GID is the UNIX user ID or group ID of the user who executes
# make. If the UID or GID is not passed as a make variable, an attempt
# is made to determine it.
UID?=$(shell id --user)
GID?=$(shell id --group)

# VERSION
# If no version is specified as a parameter of make, the last git hash
# value is taken.
VERSION?=$(shell git rev-parse --short HEAD)-git

# IMAGE I
# MAGE defines the docker image to compile latex into a pdf file.
IMAGE:=volkerraschek/docker-latex:latest-ubuntu18.04

# Input tex-file and output pdf-file
FILE:=index
PDF_FILE:=${FILE}.pdf
IDX_FILE:=${FILE}.idx
TEX_FILE:=${FILE}.tex

# HARDLINK_VARIABLES
# FSD:           Defines the general storage location for study documents.
# HARDLINK_PATH: This should be extended with the value from FSD. For example
#                for the subject Mathematics: ${FSD}/Mathematics
# HARDLINK_FILE: Name of the document to be linked under the path HARDLINK_PATH.
FSD?=${HOME}/Dokumente/Studium/Fachschaftsdaten
HARDLINK_PATH:=${FSD}/DWH_-_Data_Warehouse/Tutorien/Tutorium_SS18
HARDLINK_FILE:=Tutorium_SS18.pdf

# latexmk
# compile the pdf file with latexmk
latexmk:
	latexmk \
		-shell-escape \
		-synctex=1 \
		-interaction=nonstopmode \
		-file-line-error \
		-pdf ${TEX_FILE}

# pdflatex
# compile the pdf file with pdflatex
pdflatex: makeglossar makeindex
	pdflatex \
		-shell-escape \
		-synctex=1 \
		-interaction=nonstopmode \
		-enable-write18 ${TEX_FILE}

# makeglossar
# generate the glossar
makeglossar:
	makeglossaries ${FILE}

# makeindex
# generate the index
makeindex:
	makeindex ${IDX_FILE}

# docker-latexmk
# compile the pdf file with latexmk inside a docker container
container-latexmk:
	docker run \
		--rm \
		--user=${UID}:${GID} \
		--net=none \
		--volume=${PWD}:/data ${IMAGE} \
		make latexmk VERSION=${VERSION}

# docker-pdflatex
# compile the pdf file with pdflatex inside a docker container
container-pdflatex:
	docker run \
		--rm \
		--user=${UID}:${GID} \
		--net=none \
		--volume=${PWD}:/data ${IMAGE} \
		make pdflatex VERSION=${VERSION}

# clean
# remove all files which are ignored about .gitignore
clean:
	git clean -fX

# create-hardlink
# Create a hardlink of the generated pdf file into a different directory.
# It's could use to create a hardlink from the compiled pdf into in your documents
# directory.
create-hardlink: delete-hardlink
	if [ ! -d ${HARDLINK_PATH} ]; \
	then \
		mkdir -p ${HARDLINK_PATH}; \
	fi;

	if [ ! -f ${PDF_FILE} ]; \
	then \
		echo "Compile the PDF file first!"; \
	fi;

	ln ${PDF_FILE} ${HARDLINK_PATH}/${HARDLINK_FILE}

# delete-hardlink
# Delete the hardlink
delete-hardlink:
	if [ -f ${HARDLINK_PATH}/${HARDLINK_FILE} ]; \
	then \
		rm -R ${HARDLINK_PATH}/${HARDLINK_FILE}; \
	fi;

destroy-schema:
	./sh/delete-schema.sh

import-model:
	./sh/import-model.sh

execute-solutions:
	./sh/execute-solutions.sh FOLDER=${FOLDER}
