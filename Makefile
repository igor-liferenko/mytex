all:
	@find ~/tex/TeXinputs/ -xtype l -exec rm {} \;
	@for i in `ls ~/tex/TeXfonts`; do [ $$i = trip.tfm ] && continue; grep -q $${i%.tfm} ~/tex/plain.tex && continue; rm ~/tex/TeXfonts/$$i; done
	@find ~/mf/MFinputs/ -xtype l -exec rm {} \;
	@ln -sf ~/cweb/cwebmac.tex ~/tex/TeXinputs/
	@cd TeXinputs; for i in *; do ln -sf ~/mytex/TeXinputs/$$i ~/tex/TeXinputs/; done
	@sed 's|input hyphen|input ../tex/hyphen|' ~/tex/plain.tex >plain.tex
	@perl -i -pe 'if(/(\\font.*?=)c(\w+)/&&-e"TeXfonts/o$$2.tfm"){s//$$1o$$2/}' plain.tex
	@sed 's|hyph-ru|TeXformats/&|' TeXformats/тех.tex >тех.tex
	@cd ~/mf; for i in *.tfm; do ln -sf ~/mf/$$i ~/tex/TeXfonts/; done # see MakePK
	@cp TeXfonts/* ~/tex/TeXfonts/                                     # see MakePK
	@~/tex/initex 'тех \input ../tex/paper+origin \dump' >/dev/null && mv тех.fmt ~/tex/TeXformats/
	@sed -s '/TENRM/,$$d' тех.tex TeXformats/12pt.tex >12pt.tex
	@~/tex/initex '12pt \input ../tex/paper+origin \dump' >/dev/null && mv 12pt.fmt ~/tex/TeXformats/
	@sed -s '/TENRM/,$$d' тех.tex TeXformats/14pt.tex >14pt.tex
	@~/tex/initex '14pt \input ../tex/paper+origin \dump' >/dev/null && mv 14pt.fmt ~/tex/TeXformats/
	@sed -s '/TENRM/,$$d' тех.tex TeXformats/17pt.tex >17pt.tex
	@~/tex/initex '17pt \input ../tex/paper+origin \dump' >/dev/null && mv 17pt.fmt ~/tex/TeXformats/
	@rm -f plain.tex тех.* 12pt.* 14pt.* 17pt.*
	@for i in `cd MFinputs/cm; grep -L Math cm*[0-9]*`; do sed 's/generate /input lcyrbeg;\nfor i=length(jobname) downto 1:\n  gensize:=i;\n  exitif (substring(i-1,i) of jobname)>"9";\nendfor\ngensize:=scantokens(substring(gensize,infinity) of jobname);\ninput omcodes;\ninput lcyrdefs;\n&ld/' MFinputs/cm/$$i >MFinputs/om/om$${i#cm}; done # equivalent to fikparm.mf
	@for i in `cd MFinputs/om; ls om*`; do sed 's/generate \(\w*\)/generate \U\1/' MFinputs/om/$$i >MFinputs/om/$$(echo $${i%.*}|tr a-z A-Z).mf; done # om/om* -> om/OM*
	@for i in `cd MFinputs/lh; ls ld*`; do sed '0,/lgrusu/s//LGRUSU/' MFinputs/lh/$$i >MFinputs/om/$$(echo $${i%.*}|tr a-z A-Z).mf; done # lh/ld* -> om/LD*
	@sed '/CYR_.YO\|CYR_.I_shrt/a charht:=cap_height#;' MFinputs/lh/lgrusu.mf >MFinputs/om/LGRUSU.mf # make height of uppercase accented characters the same as non-accented ones (for strut-based code)
	@find MFinputs -name '*.mf' -exec ln -sf ~/mytex/{} ~/mf/MFinputs \;
	@for i in grayf slant; do ln -sf ~/mf/$$i.mf ~/mf/MFinputs; done
