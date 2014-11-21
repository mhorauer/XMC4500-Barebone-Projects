#!/usr/bin/env bash
#
# invoke using: 
#    ./do.sh &> /dev/null
# or
#    ./do.sh
SRC=$2

if [ "$1" == "pdf" ]
then 
  asciidoc -b latex --conf-file styles/latex.conf -a icons \
           -a latex-use-bibliography-environment -a imgext=pdf \
           $SRC.asciidoc
  if [ -e $SRC.tex ]
  then
    pdflatex -interaction=nonstopmode $SRC
    makeindex $SRC
    pdflatex -interaction=nonstopmode $SRC
    rm -rfv *~ *.aux *.bak *.log *.idx *.out *.toc $SRC.ilg $SRC.ind
  fi
elif [ "$1" == "html" ]
then
#  asciidoctor -a stylesheet=asciidoctor.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=colony.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=foundation.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=foundation-lime.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=foundation-potion.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=github.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=golo.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=iconic.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=maker.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=readthedocs.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=riak.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=rocket-panda.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
#  asciidoctor -a stylesheet=rubygems.css -a stylesdir=styles -a imgext=png -a source-highlighter=pygments $SRC.asciidoc
  asciidoctor -a imgext=png -a source-highlighter=pygments $SRC.asciidoc -o $SRC.html

else
  echo "Cleaining up ..."
  rm -rfv *~ *.aux *.bak *.log *.idx *.out *.toc $SRC.ilg $SRC.ind $SRC.tex $SRC.pdf $SRC.html
fi

