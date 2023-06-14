For checking if all necessary fonts were installed to ~/tex/TeXfonts/<mode>/

@x
@h
@y
#include <unistd.h>
@h
void cleanup(void) { system("rm -r /tmp/mf.$PPID"); }
@z

@x
cur_name[r+1]= '.' ;cur_name[r+2]= 't' ;cur_name[r+3]= 'f' ;cur_name[r+4]= 'm'
;cur_name[r+5]=0
@y
cur_name[r+1]= '.' ;cur_name[r+2]= 't' ;cur_name[r+3]= 'f' ;cur_name[r+4]= 'm'
;cur_name[r+5]=0;
if (p)
  printf("DVIFONT: do not use fonts with path\n"), exit(1);
else {
  char f[20];
  sprintf(f, "%.*s", font_name[nf+1]-font_name[nf], names+font_name[nf]);
  if (strcmp(f, getenv("fontname")) == 0) {
    int dpi = round(resolution*m/1000);
    printf("%s.%dpk\n", f, dpi);
  }
}
@z

@x
  in_postamble=true;read_postamble();in_postamble=false;
@y
  system("mkdir /tmp/mf.$PPID"); atexit(cleanup);
  in_postamble=true;read_postamble();in_postamble=false;
  exit(0);
@z
