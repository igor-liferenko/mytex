@x
This is the vanilla version of rstex with minimal changes from the original tex.web.
*/

@y
This is the unix specific version of rstex.

*/
#include <unistd.h>
@z

@x
	for (int i = 127; i < 256; i++)
		xchr[i] = L' ';
@y
	for (int i = 127; i < 256; i++)
		xchr[i] = L' ';
  xchr[0x80] = L'А';
  xchr[0xa0] = L'а';
  xchr[0x81] = L'Б';
  xchr[0xa1] = L'б';
  xchr[0x82] = L'В';
  xchr[0xa2] = L'в';
  xchr[0x83] = L'Г';
  xchr[0xa3] = L'г';
  xchr[0x84] = L'Д';
  xchr[0xa4] = L'д';
  xchr[0x85] = L'Е';
  xchr[0xa5] = L'е';
  xchr[0xf0] = L'Ё';
  xchr[0xf1] = L'ё';
  xchr[0x86] = L'Ж';
  xchr[0xa6] = L'ж';
  xchr[0x87] = L'З';
  xchr[0xa7] = L'з';
  xchr[0x88] = L'И';
  xchr[0xa8] = L'и';
  xchr[0x89] = L'Й';
  xchr[0xa9] = L'й';
  xchr[0x8a] = L'К';
  xchr[0xaa] = L'к';
  xchr[0x8b] = L'Л';
  xchr[0xab] = L'л';
  xchr[0x8c] = L'М';
  xchr[0xac] = L'м';
  xchr[0x8d] = L'Н';
  xchr[0xad] = L'н';
  xchr[0x8e] = L'О';
  xchr[0xae] = L'о';
  xchr[0x8f] = L'П';
  xchr[0xaf] = L'п';
  xchr[0x90] = L'Р';
  xchr[0xe0] = L'р';
  xchr[0x91] = L'С';
  xchr[0xe1] = L'с';
  xchr[0x92] = L'Т';
  xchr[0xe2] = L'т';
  xchr[0x93] = L'У';
  xchr[0xe3] = L'у';
  xchr[0x94] = L'Ф';
  xchr[0xe4] = L'ф';
  xchr[0x95] = L'Х';
  xchr[0xe5] = L'х';
  xchr[0x96] = L'Ц';
  xchr[0xe6] = L'ц';
  xchr[0x97] = L'Ч';
  xchr[0xe7] = L'ч';
  xchr[0x98] = L'Ш';
  xchr[0xe8] = L'ш';
  xchr[0x99] = L'Щ';
  xchr[0xe9] = L'щ';
  xchr[0x9a] = L'Ъ';
  xchr[0xea] = L'ъ';
  xchr[0x9b] = L'Ы';
  xchr[0xeb] = L'ы';
  xchr[0x9c] = L'Ь';
  xchr[0xec] = L'ь';
  xchr[0x9d] = L'Э';
  xchr[0xed] = L'э';
  xchr[0x9e] = L'Ю';
  xchr[0xee] = L'ю';
  xchr[0x9f] = L'Я';
  xchr[0xef] = L'я';
  xchr[0xfc] = L'№';
@z

@x
	ready_already = 0;
@y
@z

@x
	if (a_open_in(&pool_file)) {
@y
	if (a_open_in(&pool_file, pool_file_path)) {
@z

@x
bool a_open_in(FILE **f)
@y
bool a_open_in(FILE **f, int path_specifier)
@z

@x
	*f = fopen(name_of_file.get_c_str(), "r");
@y
	if (test_access(path_specifier))
		*f = fopen(real_name_of_file.get_c_str(), "r");
	else 
		return false;

@z

@x
	*f = fopen(name_of_file.get_c_str(), "rb");
@y
	if (test_access(font_file_path))
		*f = fopen(real_name_of_file.get_c_str(), "rb");
	else
		return false;
@z

@x
	*f = fopen(name_of_file.get_c_str(), "rb");
@y
	if (test_access(format_file_path))
		*f = fopen(real_name_of_file.get_c_str(), "rb");
	else
		return false;
@z

@x
		for (int i = 1; i < argc; i++) {
@y
		for (int i = 1; i < argc; i++) {
			if (argv[i][0] == '-') // skip
				continue;		
@z

@x
	if (k <= file_name_size) name_length = k;
	else name_length = file_name_size;

	// skip fill with spaces, don't think it's needed
	//for (k = name_length + 1; k <= file_name_size; k++) name_of_file[k] = ' ';

	// addition for C, add zero terminator
	name_of_file[name_length+1] = 0;
}
@y

	// addition for C, add zero terminator
	name_of_file[k + 1] = 0;
}

@z

@x
		pack_buffered_name(format_area_length, loc, j - 1);
		if (w_open_in(&fmt_file)) goto found;
		wake_up_terminal(); wterm_ln_s(L"Sorry, I can't find that format; will try PLAIN.");
@y
		wake_up_terminal(); 
		wterm_ln_s(L"Sorry, I can't find that format; will try PLAIN.");
@z

@x
		if (c == TEX_STRING(">") ||
			c == TEX_STRING(":")) {
@y
		if (c == TEX_STRING("/")) {
@z

@x
	if (k <= file_name_size) name_length = k; else name_length = file_name_size;

	// skip fill with zeros, don't think it's needed
	//for (k = name_length + 1; k <= file_name_size; k++) name_of_file[k] = ' ';

	// addition for C, add zero terminator
	name_of_file[name_length+1] = 0;

@y

	name_of_file[k + 1] = 0;
@z

@x
	if (pool_ptr + name_length > pool_size || str_ptr == max_strings || cur_length > 0)
@y
	if (pool_ptr + strlen(name_of_file.get_c_str()) > pool_size || str_ptr == max_strings || cur_length > 0)
@z

@x
		for (k = 1; k <= name_length; k++) append_char(name_of_file[k]);
@y
		for (k = 1; k <= (int)strlen(name_of_file.get_c_str()); k++) append_char(name_of_file[k]);
@z

@x
						print_nl(TEX_STRING("You want to edit file "));
						slow_print(input_stack[base_ptr].name_field);
						print(TEX_STRING(" at line ")); print_int(line);
						interaction = scroll_mode;
@y
						ed_name_start = str_start[edit_file.name_field];
						ed_name_length = str_start[edit_file.name_field+1] - str_start[edit_file.name_field];
						edit_line = line;
@z

@x
	if (aire == TEX_STRING("")) 
		pack_file_name(nom, TEX_font_area, TEX_STRING(".tfm"));
@y
	pack_file_name(nom, aire, TEX_STRING(".tfm"));
@z

@x
			print_nl(TEX_STRING("Transcript written on "));
			slow_print(log_name);
			print_char('.');
		}
	}
}
@y
			print_nl(TEX_STRING("Transcript written on "));
			slow_print(log_name);
			print_char('.');
		}
	}
	if(ed_name_start != 0 && interaction > batch_mode)
		call_edit(&str_pool[ed_name_start], ed_name_length, edit_line);
}

//////////////////////////////////////////////////////////////////////////////
// Unix specific routine to open editor
//
void call_edit(packed_ASCII_code *filename, int fnlength, int linenumber)
{
	char *temp;
	char *command;
	char c;
	int sdone;
	int ddone;
	int i;
	
	char dvalue[] = "emacs +%d %s";
	char *texeditvalue = dvalue;
	sdone = ddone = 0;
	
	if(NULL != (temp = getenv("TEXEDIT")))
		texeditvalue = temp;
	
	if (NULL == (command = (char*)malloc(strlen(texeditvalue) + fnlength + 25))) {
		fwprintf(stderr, L"! Not enough memory to issue editor command\n");
		exit(1);
	}
	temp = command;
	while ((c = *texeditvalue++) != 0) {
		if (c == '%') {
			switch (c = *texeditvalue++) {
				case 'd':
					if(ddone) {
						fwprintf(stderr, L"! Line number cannot appear twice in editor command\n");
						exit(1);
					}
					sprintf(temp, "%d", linenumber);
					while (*temp != 0)
						temp++;
					ddone = 1;
					break;
				case 's':
					if (sdone) {
						fwprintf(stderr, L"! Filename cannot appear twice in editor command\n");
						exit(1);
					}
					i = 0;
					while (i < fnlength)
						*temp++ = filename[i++];
					sdone = 1;
					break;
				case 0:
					*temp++ = '%';
					texeditvalue--; // Back up to \0 to force termination
					break;
				default:
					*temp++ = '%';
					*temp++ = c;
					break;					
			}
		}
		else
			*temp++ = c;
	}
	*temp = 0;
	
	if (0 != system(command))
		fwprintf(stderr, L"! Trouble executing command %s\n", command);
	
	
	exit(1);
}

//////////////////////////////////////////////////////////////////////////////
@z

@x
// 1338
@y
// 1338
// skip implementing this for now
@z

@x
void debug_help() //{routine to display various things}
@y
void debug_help()
@z

@x
			TEX_STRING("I changed this one to zero."));
		int_error(cur_val);
		cur_val = 0;
	}
}

@y
			TEX_STRING("I changed this one to zero."));
		int_error(cur_val);
		cur_val = 0;
	}
}

///////////////////////////////////////////////////////////////////////////
// System specific addition for paths on unix

void copypath(char *s1, char *s2, int n)
{
	while ((*s1++ = *s2++) != 0) {
		if (--n == 0) {
			fwprintf(stderr, L"! Environment search path is too big\n");
			*--s1 = 0;
			return;
		}
	}
}

void set_paths()
{
	char *envpath;
	if ((envpath = getenv("MYTEXINPUTS")) != NULL)
		copypath(input_path, envpath, MAX_INPUT_CHARS);
	if ((envpath = getenv("MYTEXFONTS")) != NULL)
		copypath(font_path, envpath, MAX_INPUT_CHARS);
	if ((envpath = getenv("MYTEXFORMATS")) != NULL)
		copypath(format_path, envpath, MAX_INPUT_CHARS);
	if ((envpath = getenv("MYTEXPOOL")) != NULL)
		copypath(pool_path, envpath, MAX_INPUT_CHARS);
}

void pack_real_name_of_file(char **cpp)
{
	char *p;
	char *real_name;

	real_name = &real_name_of_file[1];
	if ((p = *cpp) != NULL) {
		while ((*p != ':') && (*p != 0)) {
			*real_name++ = *p++;
			if (real_name == &real_name_of_file[file_name_size])
				break;
		}
		if (*p == 0) *cpp = NULL;
		else *cpp = p + 1;
		*real_name++ = '/';
	}
	p = name_of_file.get_c_str();
	
	while (*p != 0) {
		if (real_name >= &real_name_of_file[file_name_size]) {
			fwprintf(stderr, L"! Full file name is too long\n");
			break;
		}
		*real_name++ = *p++;
	}
	*real_name = 0;
	
}

bool test_access(int filepath)
{
	bool ok;
	char *cur_path_place;

	switch (filepath) {
	case no_file_path: cur_path_place = NULL; break;
	case input_file_path: 
	case read_file_path:
		cur_path_place = input_path; break;
	case font_file_path: cur_path_place = font_path; break;
	case format_file_path: cur_path_place = format_path; break;
	case pool_file_path: cur_path_place = pool_path; break;
	default:
		fwprintf(stderr, L"! This should not happen, test_access\n");
		exit(1);
		break;
	}
	if (name_of_file[1] == '/')
		cur_path_place = NULL;
	do {
		pack_real_name_of_file(&cur_path_place);
		if (access(real_name_of_file.get_c_str(), F_OK) == 0)
			ok = true;
		else
			ok = false;
	} while (!ok && cur_path_place != NULL);

	return ok;
}

///////////////////////////////////////////////////////////////////////////


@z

@x
		if (a_open_in(&cur_file)) goto done;
		if (cur_area == TEX_STRING("")) {
			pack_file_name(cur_name, TEX_area, cur_ext);
			if (a_open_in(&cur_file)) goto done;
@y
		if (a_open_in(&cur_file, input_file_path)) goto done;
		if (cur_ext == TEX_STRING(".tex")) {
			pack_file_name(cur_name, cur_area, TEX_STRING(""));
			if (a_open_in(&cur_file, input_file_path)) goto done;
@z

@x
	print_char(TEX_STRING("(")); incr(open_parens); slow_print(name); update_terminal(); state = new_line;
	if (name == str_ptr - 1) {
		flush_string;
		name = cur_name;
	}
@y
	print_char(TEX_STRING("(")); incr(open_parens); slow_print(name); update_terminal(); state = new_line;
	
	/*
	if (name == str_ptr - 1) {
		flush_string;
		name = cur_name;
	}
	*/
@z	

@x
		if (a_open_in(&read_file[n])) read_open[n] = just_open;
@y
		if (a_open_in(&read_file[n], read_file_path)) read_open[n] = just_open;
@z

@x
	if (ready_already == 314159) {
		goto start_of_TEX;
	}
@y
	set_paths();
	
@z

@x
		fwprintf(term_out, L"Ouch---my internal constants have been clobbered!\n---case %d\n", bad);
@y
		wterm_ln_s(L"Ouch---my internal constants have been clobbered");
@z

@x
	ready_already = 314159;

start_of_TEX:

@y
@z

@x
	selector = term_only; tally = 0; term_offset = 0; file_offset = 0;

@y
	selector = term_only; tally = 0; term_offset = 0; file_offset = 0;

	char formatname[257];
	formatname[0] = 0;

	if (argc > 1) {
		// check for format=
		if (argv[1][0] == '-') {
			if (strlen(argv[1] + 1) > 8 && strncmp(argv[1] + 1, "format=", 7) == 0)
				strcpy(formatname, argv[1] + 8);
		}
	}

	if (formatname[0] != 0) {
		size_t flen = strlen(formatname);
		if (flen > 4 && strcmp(formatname + flen - 4, ".fmt") == 0)
			;
		else {
			if (flen + 4 < sizeof formatname - 1)
				strcat(formatname, ".fmt");
		}

		strcpy(name_of_file.get_c_str(), formatname);
		bool fmt_loaded = false;
		if (w_open_in(&fmt_file)) {
			fmt_loaded = load_fmt_file();
			w_close(fmt_file);
		}
		if (!fmt_loaded) {
			wprintf(L"! Error loading format file %s\n", formatname);
			goto final_end;
		}
	}
@z
