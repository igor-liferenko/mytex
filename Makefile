TEX := ~/tex
MF  := ~/mf

all:
	@sed -n 's/.*PKFONTS=/rm -rf /e' dvips
# begin cleanup
	@find $(TEX)/TeXinputs -type l -exec rm {} \;
	@find $(TEX)/TeXfonts -type l ! -name trip.tfm -exec rm {} \;
	@find $(MF)/MFinputs -type l -exec rm {} \;
	@find $(TEX)/TeXformats -name '*.fmt' ! -name plain.fmt -exec rm {} \;
# end cleanup
	@ln -s ~/cweb/cwebmac.tex $(TEX)/TeXinputs
	@find TeXinputs -type f -exec ln -s $(PWD)/{} $(TEX)/TeXinputs \;
	@find MFinputs -name '*.mf' -exec ln -s $(PWD)/{} $(MF)/MFinputs \;
	@cd MFinputs/tfm; for i in *.mf; do base=plain $(MF)/virmf \
	  '\mode=localfont; batchmode; input '$$i >/dev/null || exit; done # NOTE: 'localfont' must be used for printing
	@find TeXfonts -name '*.tfm' -exec ln -s $(PWD)/{} $(TEX)/TeXfonts \;
	@sed '/preloaded/b;/cmmi/b;/cmsy/b;/cmex/b;/^%/b;s/=c/=o/' $(TEX)/plain.tex >plain.tex
	@ln -s $(TEX)/hyphen.tex; ln -s TeXformats/hyph-ru.tex
	@for i in 10pt 12pt 14pt 17pt; do \
	  cat TeXformats/тех.tex TeXformats/$$i.tex $(TEX)/paper+origin.tex >$$i.tex; \
	  $(TEX)/initex "$$i \dump" >/dev/null && mv $$i.fmt $(TEX)/TeXformats; rm $$i.tex; done
	@rm plain.tex hyphen.tex hyph-ru.tex
	@for i in `cd MFinputs/cm; grep -L Math cm*[0-9]*`; do sed 's/generate /input lcyrbeg;\nfor i=length(jobname) downto 1:\n  gensize:=i;\n  exitif (substring(i-1,i) of jobname)>"9";\nendfor\ngensize:=scantokens(substring(gensize,infinity) of jobname);\ninput omcodes;\ninput lcyrdefs;\n&ld/' MFinputs/cm/$$i >MFinputs/om/om$${i#cm}; done # equivalent to fikparm.mf
	@for i in `cd MFinputs/om; ls om*`; do sed 's/generate \(\w*\)/generate \U\1/' MFinputs/om/$$i >MFinputs/om/$$(echo $${i%.*}|tr a-z A-Z).mf; done # om/om* -> om/OM*
	@for i in `cd MFinputs/lh; ls ld*`; do sed '0,/lgrusu/s//LGRUSU/' MFinputs/lh/$$i >MFinputs/om/$$(echo $${i%.*}|tr a-z A-Z).mf; done # lh/ld* -> om/LD*
	@sed '/CYR_.YO\|CYR_.I_shrt/a charht:=cap_height#;' MFinputs/lh/lgrusu.mf >MFinputs/om/LGRUSU.mf # make height of uppercase accented characters the same as non-accented ones (for strut-based code)
