#!/bin/sh
# for gftodvi; by default landscape mode is used, so swap pdfpagewidth with pdfpageheight and
# pdfhorigin with pdfvorigin
mkdir /tmp/tex.$$
if [ "$pdfpagewidth" ]; then
  pdfpagewidth=$(cd /tmp/tex.$$; tex "\dimen0=$pdfpagewidth\count0=\dimen0\message{\the\count0}\end" | sed -n 2p)
else
  pdfpagewidth=$(cd /tmp/tex.$$; tex "\count0=\pdfpageheight\message{\the\count0}\end" | sed -n 2p)
fi
if [ "$pdfpageheight" ]; then
  pdfpageheight=$(cd /tmp/tex.$$; tex "\dimen0=$pdfpageheight\count0=\dimen0\message{\the\count0}\end" | sed -n 2p)
else
  pdfpageheight=$(cd /tmp/tex.$$; tex "\count0=\pdfpagewidth\message{\the\count0}\end" | sed -n 2p)
fi
if [ "$pdfhorigin" ]; then
  pdfhorigin=$(cd /tmp/tex.$$; tex "\dimen0=$pdfhorigin\count0=\dimen0\message{\the\count0}\end" | sed -n '/-/!s/^/+/;2p')
else
  pdfhorigin=$(cd /tmp/tex.$$; tex "\count0=\pdfvorigin\message{\the\count0}\end" | sed -n '/-/!s/^/+/;2p')
fi
if [ "$pdfvorigin" ]; then
  pdfvorigin=$(cd /tmp/tex.$$; tex "\dimen0=$pdfvorigin\count0=\dimen0\message{\the\count0}\end" | sed -n '/-/!s/^/+/;2p')
else
  pdfvorigin=$(cd /tmp/tex.$$; tex "\count0=\pdfhorigin\message{\the\count0}\end" | sed -n '/-/!s/^/+/;2p')
fi
rm -r /tmp/tex.$$
echo ${pdfpagewidth}x${pdfpageheight}$pdfhorigin$pdfvorigin
