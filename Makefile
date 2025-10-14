TEXFORMATS := ~/tex/TeXformats
TEXINPUTS  := ~/tex/TeXinputs
TEXFONTS   := ~/tex/TeXfonts
# TODO: in MakePK take from ^^^^^^^^^^
MFINPUTS   := ~/mf/MFinputs
PKFONTS    := ~/.PKfonts
# TODO: in ./dvips take from ^^^^^^^^^^
all:
	@rm -rf $(PKFONTS)
# begin cleanup
	@find $(TEXINPUTS) -type l -exec rm {} \;
	@for i in `ls $(TEXFONTS) | grep -wv trip.tfm`; do grep -wq font.*=$${i%.tfm} $(TEXINPUTS)/../plain.tex || rm $(TEXFONTS)/$$i; done
	@find $(MFINPUTS) -type l -exec rm {} \;
	@for i in `ls $(TEXFORMATS) | grep -wv plain.fmt`; do rm $(TEXFORMATS)/$$i; done
# end cleanup
	@ln -s ~/cweb/cwebmac.tex $(TEXINPUTS)
	@ln -s ~/term/QUIRE.tex $(TEXINPUTS)
	@cd TeXinputs; for i in *; do ln -s ~/mytex/TeXinputs/$$i $(TEXINPUTS); done
	@cd $(MFINPUTS)/..; for i in *.tfm; do ln -s $(MFINPUTS)/../$$i $(TEXFONTS); done # see MakePK for how
	@cp TeXfonts/* $(TEXFONTS)                                                        # 'ln' differs from 'cp'
	@sed '/preloaded/b;/cmmi/b;/cmsy/b;/cmex/b;/^%/b;s/=c/=o/' $(TEXINPUTS)/../plain.tex >plain.tex
	@ln -s $(TEXINPUTS)/../hyphen.tex; ln -s TeXformats/hyph-ru.tex
	@for i in 10pt 12pt 14pt 17pt; do \
	  cat TeXformats/тех.tex TeXformats/$$i.tex $(TEXINPUTS)/../paper+origin.tex >$$i.tex; \
	  $(TEXFORMATS)/../initex "$$i \dump" >/dev/null && mv $$i.fmt $(TEXFORMATS); rm $$i.tex; done
	@rm plain.tex hyphen.tex hyph-ru.tex
	@for i in `cd MFinputs/cm; grep -L Math cm*[0-9]*`; do sed 's/generate /input lcyrbeg;\nfor i=length(jobname) downto 1:\n  gensize:=i;\n  exitif (substring(i-1,i) of jobname)>"9";\nendfor\ngensize:=scantokens(substring(gensize,infinity) of jobname);\ninput omcodes;\ninput lcyrdefs;\n&ld/' MFinputs/cm/$$i >MFinputs/om/om$${i#cm}; done # equivalent to fikparm.mf
	@for i in `cd MFinputs/om; ls om*`; do sed 's/generate \(\w*\)/generate \U\1/' MFinputs/om/$$i >MFinputs/om/$$(echo $${i%.*}|tr a-z A-Z).mf; done # om/om* -> om/OM*
	@for i in `cd MFinputs/lh; ls ld*`; do sed '0,/lgrusu/s//LGRUSU/' MFinputs/lh/$$i >MFinputs/om/$$(echo $${i%.*}|tr a-z A-Z).mf; done # lh/ld* -> om/LD*
	@sed '/CYR_.YO\|CYR_.I_shrt/a charht:=cap_height#;' MFinputs/lh/lgrusu.mf >MFinputs/om/LGRUSU.mf # make height of uppercase accented characters the same as non-accented ones (for strut-based code)
	@find MFinputs -name '*.mf' -exec ln -s ~/mytex/{} $(MFINPUTS) \;
	@for i in grayf slant; do ln -s $(MFINPUTS)/../$$i.mf $(MFINPUTS); done
