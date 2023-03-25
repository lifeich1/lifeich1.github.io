#!/usr/bin/make -f


MD_FROM_ORG := golden_yang.md

.PHONY: all
all: $(MD_FROM_ORG)

$(MD_FROM_ORG): ap = $(file >>$@,$1)
$(MD_FROM_ORG): %.md : %.org
	$(file >$@,---) $(call ap,layout: post) $(call ap,---)
	pandoc $< -t markdown >> $@
