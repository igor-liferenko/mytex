all:
	@sed -n '/mode parameters could change/{s/\t@//e;q5}' ~/mf/Makefile; test $$? = 5
	@find ~/tex/TeXinputs/ -type l -exec rm {} \;
	@for i in `ls ~/tex/TeXfonts | grep -v trip.tfm`; do grep -q $${i%.tfm} ~/tex/plain.tex || rm ~/tex/TeXfonts/$$i; done
	@find ~/mf/MFinputs/ -type l -exec rm {} \;
	@[ -e ~/cweb/cwebmac.tex ] && ln -s ~/cweb/cwebmac.tex ~/tex/TeXinputs || echo ERROR: no \~/cweb/cwebmac.tex
	@cd TeXinputs; for i in *; do ln -s ~/mytex/TeXinputs/$$i ~/tex/TeXinputs; done
	@cd ~/mf; for i in *.tfm; do ln -s ~/mf/$$i ~/tex/TeXfonts; done # see MakePK
	@cp TeXfonts/* ~/tex/TeXfonts                                    # see MakePK
	@sed '/preloaded/b;/cmmi/b;/cmsy/b;/cmex/b;/^%/b;s/=c/=o/' ~/tex/plain.tex >plain.tex
	@ln -s ~/tex/hyphen.tex
	@ln -s TeXformats/hyph-ru.tex
	@cat TeXformats/тех.tex TeXformats/10pt.tex ~/tex/paper+origin.tex >10pt.tex
	@~/tex/initex '10pt \dump' >/dev/null && mv 10pt.fmt ~/tex/TeXformats
	@cat TeXformats/тех.tex TeXformats/12pt.tex ~/tex/paper+origin.tex >12pt.tex
	@~/tex/initex '12pt \dump' >/dev/null && mv 12pt.fmt ~/tex/TeXformats
	@cat TeXformats/тех.tex TeXformats/14pt.tex ~/tex/paper+origin.tex >14pt.tex
	@~/tex/initex '14pt \dump' >/dev/null && mv 14pt.fmt ~/tex/TeXformats
	@cat TeXformats/тех.tex TeXformats/17pt.tex ~/tex/paper+origin.tex >17pt.tex
	@~/tex/initex '17pt \dump' >/dev/null && mv 17pt.fmt ~/tex/TeXformats
	@rm plain.tex hyphen.tex hyph-ru.tex 10pt.* 12pt.* 14pt.* 17pt.*
	@for i in `cd MFinputs/cm; grep -L Math cm*[0-9]*`; do sed 's/generate /input lcyrbeg;\nfor i=length(jobname) downto 1:\n  gensize:=i;\n  exitif (substring(i-1,i) of jobname)>"9";\nendfor\ngensize:=scantokens(substring(gensize,infinity) of jobname);\ninput omcodes;\ninput lcyrdefs;\n&ld/' MFinputs/cm/$$i >MFinputs/om/om$${i#cm}; done # equivalent to fikparm.mf
	@for i in `cd MFinputs/om; ls om*`; do sed 's/generate \(\w*\)/generate \U\1/' MFinputs/om/$$i >MFinputs/om/$$(echo $${i%.*}|tr a-z A-Z).mf; done # om/om* -> om/OM*
	@for i in `cd MFinputs/lh; ls ld*`; do sed '0,/lgrusu/s//LGRUSU/' MFinputs/lh/$$i >MFinputs/om/$$(echo $${i%.*}|tr a-z A-Z).mf; done # lh/ld* -> om/LD*
	@sed '/CYR_.YO\|CYR_.I_shrt/a charht:=cap_height#;' MFinputs/lh/lgrusu.mf >MFinputs/om/LGRUSU.mf # make height of uppercase accented characters the same as non-accented ones (for strut-based code)
	@find MFinputs -name '*.mf' -exec ln -s ~/mytex/{} ~/mf/MFinputs \;
	@for i in grayf slant; do ln -s ~/mf/$$i.mf ~/mf/MFinputs; done
