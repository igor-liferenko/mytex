@x
@<Read the font parameters into position for font |nf|, and print the font name@>;
@y
@<Read the font parameters into position for font |nf|, and print the font name@>;
if (p) printf("DVIFONT: do not use fonts with path\n"), exit(1);
@z

@x
  in_postamble=true;read_postamble();in_postamble=false;
@y
  in_postamble=true;read_postamble();in_postamble=false;
  exit(0);
@z
