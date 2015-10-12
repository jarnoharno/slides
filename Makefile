DOC=slides
OUT=out

${DOC}.pdf: ${DOC}.tex | ${OUT}
	rubber --pdf --into=${OUT} ${DOC}

${OUT}:
	mkdir $@

.PHONY: cont
cont: | ${OUT}
	while true; do \
		mkdir ${OUT} ; \
		rubber --pdf --into=${OUT} ${DOC} ; \
		inotifywait -e modify ${DOC}.tex ; \
	done

.PHONY: clean
clean: | ${OUT}
	rubber --pdf --into=${OUT} --clean ${DOC}
	rm -rf ${OUT}
