@x
@h
@y
#include <unistd.h>
@h
void cleanup(void) { system("rm -r /tmp/mf.$PPID"); }
int ret = 0;
@z

@x
cur_name[r+1]= '.' ;cur_name[r+2]= 't' ;cur_name[r+3]= 'f' ;cur_name[r+4]= 'm'
;cur_name[r+5]=0
@y
cur_name[r+1]=0;
char pk_name[strlen(cur_name0)+20];
int dpi = round(resolution*m/1000);
sprintf(pk_name, "%s.%dpk", cur_name0, dpi);
cur_name[r+1]= '.' ;cur_name[r+2]= 't' ;cur_name[r+3]= 'f' ;cur_name[r+4]= 'm'
;cur_name[r+5]=0;
if (p)
  printf("DVIFONT: do not use fonts with path\n"), exit(1);
else
  if (access(pk_name, F_OK) != 0) {
    char f[20], ff[200], cmd[500];
    sprintf(f, "%.*s", font_name[nf+1]-font_name[nf], names+font_name[nf]);
    sprintf(cmd, "test -L " default_directory_name "%s.tfm", f);
    if (system(cmd) == 0) sprintf(ff, "%s/mf/%s", getenv("HOME"), f);
    else sprintf(ff, "%s", f);
    sprintf(cmd, "cd /tmp/mf.$PPID;"
      "~/mf/plain '\\mode=%s; mag=%d+%d/1000; batchmode; input %s' </dev/null >/dev/null"
      "|| exit 3; test -e *.tfm || exit 4; diff *.tfm " default_directory_name "%s.tfm >/dev/null"
      "|| exit 5; ~/mytex/gftopk *.%dgf || exit 6;"
      "mkdir -p " default_directory_name "$mode; mv *pk " default_directory_name "$mode; rm *",
      getenv("mode"), m/1000, m%1000, ff, f, dpi);
    int r = system(cmd);
    if (r != 0) ret = 1;
    if (r == 3)
      printf("DVIFONT: %s.%dpk not in MFinputs\n", f, dpi); // fonts in MFinputs should always work
    if (r == 4)
      printf("DVIFONT: tfm is not generated in mode %s (i.e., fontmaking is 0)\n", getenv("mode"));
    if (r == 5)
      printf("DVIFONT: there is one of the following problems:\n"
             "         1) this font name is already used in MFinputs\n"
             "         2) TeXfonts/%s.tfm is out-of-date\n", f);
    if (r == 6)
      printf("DVIFONT: gftopk failed\n");
  }
@z

@x
  in_postamble=true;read_postamble();in_postamble=false;
@y
  system("mkdir /tmp/mf.$PPID"); atexit(cleanup);
  in_postamble=true;read_postamble();in_postamble=false;
  exit(ret);
@z
