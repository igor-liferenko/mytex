@x
@h
@y
#include <assert.h>
#include <sys/stat.h>
#include <unistd.h>
@h
void cleanup(void) { system("rm -r /tmp/mf.$PPID"); }
int ret = 0; // try to create PK-files for all fonts in one run
@z

@x
  print_ln("---check sum doesn't match previous definition!");
@y
  printf("DVIFONT: check sum doesn't match previous definition\n"), exit(1);
@z

@x
  print_ln("---scaled size doesn't match previous definition!");
@y
  printf("DVIFONT: scaled size doesn't match previous definition\n"), exit(1);
@z

@x
  print_ln("---design size doesn't match previous definition!");
@y
  printf("DVIFONT: design size doesn't match previous definition\n"), exit(1);
@z

@x
if (mismatch) print_ln("---font name doesn't match previous definition!");
@y
if (mismatch) printf("DVIFONT: font name doesn't match previous definition\n"), exit(1);
@z

@x
open_tfm_file();
@y
open_tfm_file();
int dpi = round(resolution*m/1000);
char f[20];
sprintf(f, "%.*s", font_name[nf+1]-font_name[nf], names+font_name[nf]);
char *mode;
assert((mode = getenv("mode")) != NULL);
char pk_name[default_directory_name_length+strlen(mode)+strlen(f)+10];
sprintf(pk_name, "%s%s/%s.%dpk", default_directory_name, mode, f, dpi);
if (access(pk_name, F_OK) != 0) {
  char *tfm_name = cur_name0;
  struct stat sb;
  assert(lstat(tfm_name, &sb) == 0);
  char ff[200];
  if (S_ISLNK(sb.st_mode)) sprintf(ff, "%s/mf/%s", getenv("HOME"), f);
  else sprintf(ff, "%s", f);
  char cmd[1000];
  sprintf(cmd, "cd /tmp/mf.$PPID;"
    "~/mf/plain '\\mode=%s; mag=%d+%d/1000; batchmode; input %s' </dev/null >/dev/null || exit 3;"
    "test -e *.tfm || exit 4;"
    "diff *.tfm %s >/dev/null || exit 5;"
    "~/mytex/gftopk *.%dgf || exit 6;"
    "mkdir -p " default_directory_name "$mode;"
    "mv *pk " default_directory_name "$mode;"
    "rm *",
    mode, m/1000, m%1000, ff, tfm_name, dpi);
  int r = system(cmd);
  assert(r != -1 && WIFEXITED(r));
  r = WEXITSTATUS(r);
  if (r == 3)
    printf("DVIFONT: `%s' not in MFinputs (TeXfonts/%s/%s.%dpk must be created manually)\n",
           f, mode, f, dpi), // other causes are not considered because fonts in MFinputs are
                             // guaranteed to work
    ret = 1;
  else if (r == 4)
    printf("DVIFONT: tfm is not generated in mode %s (i.e., fontmaking is 0)\n", mode),
    ret = 1;
  else if (r == 5)
    printf("DVIFONT: there is one of the following problems:\n"
           "         1) this font name is already used in MFinputs\n"
           "         2) TeXfonts/%s.tfm is out-of-date\n", f), ret = 1;
  else if (r == 6)
    printf("DVIFONT: gftopk failed\n"), ret = 1;
  else if (r != 0)
    printf("DVIFONT: unclassified error\n"), ret = 1;
}
@z

@x
else r=0;
@y
else printf("DVIFONT: do not use fonts with path\n"), exit(1);
@z

@x
  in_postamble=true;read_postamble();in_postamble=false;
@y
  system("mkdir /tmp/mf.$PPID"); atexit(cleanup);
  in_postamble=true;read_postamble();in_postamble=false;
  exit(ret);
@z
