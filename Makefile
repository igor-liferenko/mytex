all:
	sed 's|input hyphen|input ../tex/hyphen|' ~/tex/plain.tex >plain.tex
	ln -sf ~/cweb/cwebmac.tex ~/tex/TeXinputs/
	ln -sf ~/prt/cwebmac-ru.tex ~/tex/TeXinputs/
	~/tex/initex 'тех \input ../tex/paper+origin \dump' >/dev/null && mv тех.fmt ~/tex/TeXformats/
	echo '\input тех \input ../prt/12pt' >12pt.tex
	~/tex/initex '12pt \input ../tex/paper+origin \dump' >/dev/null && mv 12pt.fmt ~/tex/TeXformats/
	echo '\input тех \input ../prt/14pt' >14pt.tex
	~/tex/initex '14pt \input ../tex/paper+origin \dump' >/dev/null && mv 14pt.fmt ~/tex/TeXformats/
	echo '\input тех \input ../prt/17pt' >17pt.tex
	~/tex/initex '17pt \input ../tex/paper+origin \dump' >/dev/null && mv 17pt.fmt ~/tex/TeXformats/
	rm plain.tex тех.log 12pt.* 14pt.* 17pt.*
