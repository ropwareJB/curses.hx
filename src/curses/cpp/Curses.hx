package curses.cpp;

import cpp.Char;
import cpp.Reference;

@:include("curses.h") 
@:buildXml("
<target id=\"haxe\">
	<lib name='-lncurses'/>
</target>
")
@:final extern class Curses{
	
	@:native("initscr") static public function initscr():Window;
	@:native("mvaddstr") static public function mvaddstr(y:Int,x:Int,str:String):Void;
	@:native("refresh") static public function refresh():Void;
	@:native("delwin") static public function delwin(w:Window):Void;
	@:native("endwin") static public function endwin():Void;

	/* curs_color(3x) */
	@:native("") static public function start_color(void):STATE;
	@:native("") static public function init_pair(short pair, short f, short b):STATE;
	@:native("") static public function init_color(short color, short r, short g, short b):STATE;
	@:native("") static public function has_colors(void):Bool;
	@:native("") static public function can_change_color(void):Bool;
	@:native("") static public function color_content(short color, short *r, short *g, short *b):STATE;
	@:native("") static public function pair_content(short pair, short *f, short *b):STATE;

	/* curs_attr */
	@:native("") static public function attroff(int attrs):STATE;
	@:native("") static public function wattroff(WINDOW *win, int attrs):STATE;
	@:native("") static public function attron(int attrs):STATE;
	@:native("") static public function wattron(WINDOW *win, int attrs):STATE;
	@:native("") static public function attrset(int attrs):STATE;
	@:native("") static public function wattrset(WINDOW *win, int attrs):STATE;
	@:native("") static public function color_set(short color_pair_number, void* opts):STATE;
	@:native("") static public function wcolor_set(WINDOW *win, short color_pair_number, void* opts):STATE;
	@:native("") static public function standend(void):STATE;
	@:native("") static public function wstandend(WINDOW *win):STATE;
	@:native("") static public function standout(void):STATE;
	@:native("") static public function wstandout(WINDOW *win):STATE;
	@:native("") static public function attr_get(attr_t *attrs, short *pair, void *opts):STATE;
	@:native("") static public function wattr_get(WINDOW *win, attr_t *attrs, short *pair, void *opts):STATE;
	@:native("") static public function attr_off(attr_t attrs, void *opts):STATE;
	@:native("") static public function wattr_off(WINDOW *win, attr_t attrs, void *opts):STATE;
	@:native("") static public function attr_on(attr_t attrs, void *opts):STATE;
	@:native("") static public function wattr_on(WINDOW *win, attr_t attrs, void *opts):STATE;
	@:native("") static public function attr_set(attr_t attrs, short pair, void *opts):STATE;
	@:native("") static public function wattr_set(WINDOW *win, attr_t attrs, short pair, void *opts):STATE;
	@:native("") static public function chgat(int n, attr_t attr, short color, const void *opts):STATE;
	@:native("") static public function wchgat(WINDOW *win, int n, attr_t attr, short color, const void *opts):STATE;
	@:native("") static public function mvchgat(int y, int x, int n, attr_t attr, short color, const void *opts):STATE;
	@:native("") static public function mvwchgat(WINDOW *win, int y, int x, int n, attr_t attr, short color, const void *opts):STATE;

	
 /* curs_memleaks(3X)*/
	//void _nc_freeall(void);
	//void _nc_free_and_exit(int);*/

 /* curs_trace(3X)**/
	//void _tracef(const char *format, ...);
	//void _tracedump(const char *label, WINDOW *win);
	//char *_traceattr(attr_t attr);
	//char *_traceattr2(int buffer, chtype ch);
	//char *_nc_tracebits(void);
	//char * _tracecchar_t(const cchar_t *string);
	//char * _tracecchar_t2(int buffer, const cchar_t *string);
	//char *_tracechar(int ch);
	//char *_tracechtype(chtype ch);
	//char *_tracechtype2(int buffer, chtype ch);
	//char *_tracemouse(const MEVENT *event);
	//void trace(const unsigned int param);

 /* curs_add_wch(3X)*/
	@:native("") static public function add_wch( const cchar_t *wch ):STATE;
	@:native("") static public function wadd_wch( WINDOW *win, const cchar_t *wch ):STATE;
	@:native("") static public function mvadd_wch( int y, int x, const cchar_t *wch ):STATE;
	@:native("") static public function mvwadd_wch( WINDOW *win, int y, int x, const cchar_t *wch ):STATE;
	@:native("") static public function echo_wchar( const cchar_t *wch ):STATE;
	@:native("") static public function wecho_wchar( WINDOW *win, const cchar_t *wch ):STATE;

 /* curs_addch(3X)*/
	@:native("") static public function addch(const chtype ch):STATE;
	@:native("") static public function waddch(WINDOW *win, const chtype ch):STATE;
	@:native("") static public function mvaddch(int y, int x, const chtype ch):STATE;
	@:native("") static public function mvwaddch(WINDOW *win, int y, int x, const chtype ch):STATE;
	@:native("") static public function echochar(const chtype ch):STATE;
	@:native("") static public function wechochar(WINDOW *win, const chtype ch):STATE;

 /* curs_addchstr(3X)*/
	@:native("") static public function addchstr(const chtype *chstr):STATE;
	@:native("") static public function addchnstr(const chtype *chstr, int n):STATE;
	@:native("") static public function waddchstr(WINDOW *win, const chtype *chstr):STATE;
	@:native("") static public function waddchnstr(WINDOW *win, const chtype *chstr, int n):STATE;
	@:native("") static public function mvaddchstr(int y, int x, const chtype *chstr):STATE;
	@:native("") static public function mvaddchnstr(int y, int x, const chtype *chstr, int n):STATE;
	@:native("") static public function mvwaddchstr(WINDOW *win, int y, int x, const chtype *chstr):STATE;
	@:native("") static public function mvwaddchnstr(WINDOW *win, int y, int x, const chtype *chstr, int n):STATE;

 /* curs_addstr(3X)*/
	@:native("") static public function addstr(const char *str):STATE;
	@:native("") static public function addnstr(const char *str, int n):STATE;
	@:native("") static public function waddstr(WINDOW *win, const char *str):STATE;
	@:native("") static public function waddnstr(WINDOW *win, const char *str, int n):STATE;
	@:native("") static public function mvaddstr(int y, int x, const char *str):STATE;
	@:native("") static public function mvaddnstr(int y, int x, const char *str, int n):STATE;
	@:native("") static public function mvwaddstr(WINDOW *win, int y, int x, const char *str):STATE;
	@:native("") static public function mvwaddnstr(WINDOW *win, int y, int x, const char *str, int n):STATE;

 /* curs_addwstr(3X)*/
	@:native("") static public function addwstr(const wchar_t *wstr):STATE;
	@:native("") static public function addnwstr(const wchar_t *wstr, int n):STATE;
	@:native("") static public function waddwstr(WINDOW *win, const wchar_t *wstr):STATE;
	@:native("") static public function waddnwstr(WINDOW *win, const wchar_t *wstr, int n):STATE;
	@:native("") static public function mvaddwstr(int y, int x, const wchar_t *wstr):STATE;
	@:native("") static public function mvaddnwstr(int y, int x, const wchar_t *wstr, int n):STATE;
	@:native("") static public function mvwaddwstr(WINDOW *win, int y, int x, const wchar_t *wstr):STATE;
	@:native("") static public function mvwaddnwstr(WINDOW *win, int y, int x, const wchar_t *wstr, int n):STATE;

 /* default_colors(3X)**/
	@:native("") static public function use_default_colors(void):STATE;
	@:native("") static public function assume_default_colors(int fg, int bg):STATE;

 /* curs_termattrs(3X)*/
	@:native("") static public function baudrate(void):STATE;
		 char erasechar(void);
	@:native("") static public function erasewchar(wchar_t *ch):STATE;
		 bool has_ic(void);
		 bool has_il(void);
		 char killchar(void);
	@:native("") static public function killwchar(wchar_t *ch):STATE;
		 char *longname(void);
		 attr_t term_attrs(void);
		 chtype termattrs(void);
		 char *termname(void);

 /* curs_beep(3X)*/
	@:native("") static public function beep(void):STATE;
	@:native("") static public function flash(void):STATE;

 /* curs_bkgd(3X)*/
       void bkgdset(chtype ch);
       void wbkgdset(WINDOW *win, chtype ch);
	@:native("") static public function bkgd(chtype ch):STATE;
	@:native("") static public function wbkgd(WINDOW *win, chtype ch):STATE;
       chtype getbkgd(WINDOW *win);

 /* curs_bkgrnd(3X)*/
	@:native("") static public function bkgrnd( const cchar_t *wch):STATE;
	@:native("") static public function wbkgrnd( WINDOW *win, const cchar_t *wch):STATE;
       void bkgrndset(const cchar_t *wch );
       void wbkgrndset(WINDOW *win, const cchar_t *wch);
	@:native("") static public function getbkgrnd(cchar_t *wch):STATE;
	@:native("") static public function wgetbkgrnd(WINDOW *win, cchar_t *wch):STATE;

 /* curs_border(3X)*/
	@:native("") static public function border(chtype ls, chtype rs, chtype ts, chtype bs, chtype tl, chtype tr, chtype bl, chtype br):STATE;
	@:native("") static public function wborder(WINDOW *win, chtype ls, chtype rs, chtype ts, chtype bs, chtype tl, chtype tr, chtype bl, chtype br):STATE;
	@:native("") static public function box(WINDOW *win, chtype verch, chtype horch):STATE;
	@:native("") static public function hline(chtype ch, int n):STATE;
	@:native("") static public function whline(WINDOW *win, chtype ch, int n):STATE;
	@:native("") static public function vline(chtype ch, int n):STATE;
	@:native("") static public function wvline(WINDOW *win, chtype ch, int n):STATE;
	@:native("") static public function mvhline(int y, int x, chtype ch, int n):STATE;
	@:native("") static public function mvwhline(WINDOW *, int y, int x, chtype ch, int n):STATE;
	@:native("") static public function mvvline(int y, int x, chtype ch, int n):STATE;
	@:native("") static public function mvwvline(WINDOW *, int y, int x, chtype ch, int n):STATE;

 /* curs_border_set(3X)*/
	@:native("") static public function border_set(
			  const cchar_t *ls, const cchar_t *rs,
			  const cchar_t *ts, const cchar_t *bs,
			  const cchar_t *tl, const cchar_t *tr,
			  const cchar_t *bl, const cchar_t *br ):STATE;
	@:native("") static public function wborder_set(
				WINDOW *win,
				const cchar_t *ls, const cchar_t *rs,
				const cchar_t *ts, const cchar_t *bs,
				const cchar_t *tl, const cchar_t *tr, 
				const cchar_t *bl, const cchar_t *br):STATE;
	@:native("") static public function box_set(WINDOW *win, const cchar_t *verch, const cchar_t *horch):STATE;
	@:native("") static public function hline_set(const cchar_t *wch, int n):STATE;
	@:native("") static public function whline_set(WINDOW *win, const cchar_t *wch, int n):STATE;
	@:native("") static public function mvhline_set(int y, int x, const cchar_t *wch, int n):STATE;
	@:native("") static public function mvwhline_set(WINDOW *win, int y, int x, const cchar_t *wch, int n):STATE;
	@:native("") static public function vline_set(const cchar_t *wch, int n):STATE;
	@:native("") static public function wvline_set(WINDOW *win, const cchar_t *wch, int n):STATE;
	@:native("") static public function mvvline_set(int y, int x, const cchar_t *wch, int n):STATE;
	@:native("") static public function mvwvline_set(WINDOW *win, int y, int x, const cchar_t *wch, int n):STATE;


 /* curs_inopts(3X)*/
	@:native("") static public function cbreak(void):STATE;
	@:native("") static public function nocbreak(void):STATE;
	@:native("") static public function echo(void):STATE;
	@:native("") static public function noecho(void):STATE;
	@:native("") static public function halfdelay(int tenths):STATE;
	@:native("") static public function intrflush(WINDOW *win, bool bf):STATE;
	@:native("") static public function keypad(WINDOW *win, bool bf):STATE;
	@:native("") static public function meta(WINDOW *win, bool bf):STATE;
	@:native("") static public function nodelay(WINDOW *win, bool bf):STATE;
	@:native("") static public function raw(void):STATE;
	@:native("") static public function noraw(void):STATE;
		 void noqiflush(void);
		 void qiflush(void);
	@:native("") static public function notimeout(WINDOW *win, bool bf):STATE;
		 void timeout(int delay);
		 void wtimeout(WINDOW *win, int delay);
	@:native("") static public function typeahead(int fd):STATE;

 /* curs_clear(3X)*/
	@:native("") static public function erase(void):STATE;
	@:native("") static public function werase(WINDOW *win):STATE;
	@:native("") static public function clear(void):STATE;
	@:native("") static public function wclear(WINDOW *win):STATE;
	@:native("") static public function clrtobot(void):STATE;
	@:native("") static public function wclrtobot(WINDOW *win):STATE;
	@:native("") static public function clrtoeol(void):STATE;
	@:native("") static public function wclrtoeol(WINDOW *win):STATE;

 /* curs_outopts(3X)*/
	@:native("") static public function clearok(WINDOW *win, bool bf):STATE;
	@:native("") static public function idlok(WINDOW *win, bool bf):STATE;
       void idcok(WINDOW *win, bool bf);
       void immedok(WINDOW *win, bool bf);
	@:native("") static public function leaveok(WINDOW *win, bool bf):STATE;
	@:native("") static public function setscrreg(int top, int bot):STATE;
	@:native("") static public function wsetscrreg(WINDOW *win, int top, int bot):STATE;
	@:native("") static public function scrollok(WINDOW *win, bool bf):STATE;
	@:native("") static public function nl(void):STATE;
	@:native("") static public function nonl(void):STATE;

 /* curs_overlay(3X)*/
	@:native("") static public function overlay(const WINDOW *srcwin, WINDOW *dstwin):STATE;
	@:native("") static public function overwrite(const WINDOW *srcwin, WINDOW *dstwin):STATE;
	@:native("") static public function copywin(const WINDOW *srcwin, WINDOW *dstwin, int sminrow,
             int smincol, int dminrow, int dmincol, int dmaxrow,
             int dmaxcol, int overlay):STATE;

 /* curs_kernel(3X)*/
	@:native("") static public function def_prog_mode(void):STATE;
	@:native("") static public function def_shell_mode(void):STATE;
	@:native("") static public function reset_prog_mode(void):STATE;
	@:native("") static public function reset_shell_mode(void):STATE;
	@:native("") static public function resetty(void):STATE;
	@:native("") static public function savetty(void):STATE;
       void getsyx(int y, int x);
       void setsyx(int y, int x);
	@:native("") static public function ripoffline(int line, int (*init)(WINDOW *, int)):STATE;
	@:native("") static public function curs_set(int visibility):STATE;
	@:native("") static public function napms(int ms):STATE;

 /* curs_extend(3X)**/
 const char * curses_version(void);
 @:native("") static public function use_extended_names(bool enable):STATE;

 /*define_key              define_key(3X)**/
	@:native("") static public function define_key(const char *definition, int keycode):STATE;

 /* curs_terminfo(3X)*/
	@:native("") static public function setupterm(char *term, int fildes, int *errret):STATE;
	@:native("") static public function setterm(char *term):STATE;
       TERMINAL *set_curterm(TERMINAL *nterm);
	@:native("") static public function del_curterm(TERMINAL *oterm):STATE;
	@:native("") static public function restartterm(char *term, int fildes, int *errret):STATE;
       char *tparm(char *str, ...);
	@:native("") static public function tputs(const char *str, int affcnt, int (*putc)(int)):STATE;
	@:native("") static public function putp(const char *str):STATE;
	@:native("") static public function vidputs(chtype attrs, int (*putc)(int)):STATE;
	@:native("") static public function vidattr(chtype attrs):STATE;
	@:native("") static public function vid_puts(attr_t attrs, short pair, void *opts, int (*putc)(int)):STATE;
	@:native("") static public function vid_attr(attr_t attrs, short pair, void *opts):STATE;
	@:native("") static public function mvcur(int oldrow, int oldcol, int newrow, int newcol):STATE;
	@:native("") static public function tigetflag(char *capname):STATE;
	@:native("") static public function tigetnum(char *capname):STATE;
       char *tigetstr(char *capname);
       char *tiparm(const char *str, ...);

 /* curs_util(3X)*/
       char *unctrl(chtype c);
       wchar_t *wunctrl(cchar_t *c);
       char *keyname(int c);
       char *key_name(wchar_t w);
       void filter(void);
       void nofilter(void);
       void use_env(bool f);
       void use_tioctl(bool f);
	@:native("") static public function putwin(WINDOW *win, FILE *filep):STATE;
       WINDOW *getwin(FILE *filep);
	@:native("") static public function delay_output(int ms):STATE;
       int flushinp(void);

 /* curs_delch(3X)*/
	@:native("") static public function delch(void):STATE;
	@:native("") static public function wdelch(WINDOW *win):STATE;
	@:native("") static public function mvdelch(int y, int x):STATE;
	@:native("") static public function mvwdelch(WINDOW *win, int y, int x):STATE;

 /* curs_deleteln(3X)*/
	@:native("") static public function deleteln(void):STATE;
	@:native("") static public function wdeleteln(WINDOW *win):STATE;
	@:native("") static public function insdelln(int n):STATE;
	@:native("") static public function winsdelln(WINDOW *win, int n):STATE;
	@:native("") static public function insertln(void):STATE;
	@:native("") static public function winsertln(WINDOW *win)::STATE;

 /* curs_initscr(3X)*/
       WINDOW *initscr(void);
	@:native("") static public function endwin(void):STATE;
       bool isendwin(void);
       SCREEN *newterm(char *type, FILE *outfd, FILE *infd);
       SCREEN *set_term(SCREEN *new);
       void delscreen(SCREEN* sp);

 /* curs_window(3X)*/
       WINDOW *newwin(
             int nlines, int ncols,
             int begin_y, int begin_x);
	@:native("") static public function delwin(WINDOW *win):STATE;
	@:native("") static public function mvwin(WINDOW *win, int y, int x):STATE;
       WINDOW *subwin(WINDOW *orig,
             int nlines, int ncols,
             int begin_y, int begin_x);
       WINDOW *derwin(WINDOW *orig,
             int nlines, int ncols,
             int begin_y, int begin_x);
	@:native("") static public function mvderwin(WINDOW *win, int par_y, int par_x):STATE;
       WINDOW *dupwin(WINDOW *win);
       void wsyncup(WINDOW *win);
	@:native("") static public function syncok(WINDOW *win, bool bf):STATE;
       void wcursyncup(WINDOW *win);
       void wsyncdown(WINDOW *win);

	/* curs_refresh(3X)*/
	@:native("") static public function refresh(void):STATE;
	@:native("") static public function wrefresh(WINDOW *win):STATE;
	@:native("") static public function wnoutrefresh(WINDOW *win):STATE;
	@:native("") static public function doupdate(void):STATE;
	@:native("") static public function redrawwin(WINDOW *win):STATE;
	@:native("") static public function wredrawln(WINDOW *win, int beg_line, int num_lines):STATE;

	/* curs_get_wch(3X)*/
	@:native("") static public function get_wch(wint_t *wch):Int;
	@:native("") static public function wget_wch(WINDOW *win, wint_t *wch):Int;
	@:native("") static public function mvget_wch(int y, int x, wint_t *wch):Int;
	@:native("") static public function mvwget_wch(WINDOW *win, int y, int x, wint_t *wch):Int;
	@:native("") static public function unget_wch(const wchar_t wch):Int;

	/* curs_get_wstr(3X)*/
	@:native("") static public function get_wstr(wint_t *wstr):STATE;
	@:native("") static public function getn_wstr(wint_t *wstr, int n):STATE;
	@:native("") static public function wget_wstr(WINDOW *win, wint_t *wstr):STATE;
	@:native("") static public function wgetn_wstr(WINDOW *win, wint_t *wstr, int n):STATE;
	@:native("") static public function mvget_wstr(int y, int x, wint_t *wstr):STATE;
	@:native("") static public function mvgetn_wstr(int y, int x, wint_t *wstr, int n):STATE;
	@:native("") static public function mvwget_wstr(WINDOW *win, int y, int x, wint_t *wstr):STATE;
	@:native("") static public function mvwgetn_wstr(WINDOW *win, int y, int x, wint_t *wstr, int n):STATE;

/*getbegx                 curs_legacy(3X)**/
/*getbegy                 curs_legacy(3X)**/
/*getcurx                 curs_legacy(3X)**/
/*getcury                 curs_legacy(3X)**/
/*getmaxx                 curs_legacy(3X)**/
/*getmaxy                 curs_legacy(3X)**/
/*getparx                 curs_legacy(3X)**/
/*getpary                 curs_legacy(3X)**/

/* curs_getyx(3X)*/
	 void getyx(WINDOW *win, int y, int x);
	 void getparyx(WINDOW *win, int y, int x);
	 void getbegyx(WINDOW *win, int y, int x);
	 void getmaxyx(WINDOW *win, int y, int x);

/* curs_getcchar(3X)*/
	 int getcchar(
					 const cchar_t *wcval,
					 wchar_t *wch,
					 attr_t *attrs,
					 short *color_pair,
					 void *opts );
	 int setcchar(
					 cchar_t *wcval,
					 const wchar_t *wch,
					 const attr_t attrs,
					 short color_pair,
					 void *opts );


/* curs_getch(3X)*/
       int getch(void);
       int wgetch(WINDOW *win);
       int mvgetch(int y, int x);
       int mvwgetch(WINDOW *win, int y, int x);
       int ungetch(int ch);
       int has_key(int ch);

/* curs_mouse(3X)**/
		 typedef unsigned long mmask_t;

		 typedef struct {
				 short id;         /* ID to distinguish multiple devices */
				 int x, y, z;      /* event coordinates */
				 mmask_t bstate;   /* button state bits */
		 } MEVENT;

		 bool has_mouse(void);
	@:native("") static public function getmouse(MEVENT *event):STATE;
	@:native("") static public function ungetmouse(MEVENT *event):STATE;
		 mmask_t mousemask(mmask_t newmask, mmask_t *oldmask);
		 bool wenclose(const WINDOW *win, int y, int x);
		 bool mouse_trafo(int* pY, int* pX, bool to_screen);
		 bool wmouse_trafo(const WINDOW* win, int* pY, int* pX,
					bool to_screen);
		 int mouseinterval(int erval);


	/* curs_getstr(3X)*/
	@:native("") static public function getstr(char *str):STATE;
	@:native("") static public function getnstr(char *str, int n):STATE;
	@:native("") static public function wgetstr(WINDOW *win, char *str):STATE;
	@:native("") static public function wgetnstr(WINDOW *win, char *str, int n):STATE;
	@:native("") static public function mvgetstr(int y, int x, char *str):STATE;
	@:native("") static public function mvwgetstr(WINDOW *win, int y, int x, char *str):STATE;
	@:native("") static public function mvgetnstr(int y, int x, char *str, int n):STATE;
	@:native("") static public function mvwgetnstr(WINDOW *, int y, int x, char *str, int n):STATE;

	/* curs_in_wch(3X)*/
	@:native("") static public function in_wch(cchar_t *wcval):STATE;
	@:native("") static public function mvin_wch(int y, int x, cchar_t *wcval):STATE;
	@:native("") static public function mvwin_wch(WINDOW *win, int y, int x, cchar_t *wcval):STATE;
	@:native("") static public function win_wch(WINDOW *win, cchar_t *wcval):STATE;

	/* curs_in_wchstr(3X)*/
	@:native("") static public function in_wchstr(cchar_t *wchstr):STATE;
	@:native("") static public function in_wchnstr(cchar_t *wchstr, int n):STATE;
	@:native("") static public function win_wchstr(WINDOW *win, cchar_t *wchstr):STATE;
	@:native("") static public function win_wchnstr(WINDOW *win, cchar_t *wchstr, int n):STATE;
	@:native("") static public function mvin_wchstr(int y, int x, cchar_t *wchstr):STATE;
	@:native("") static public function mvin_wchnstr(int y, int x, cchar_t *wchstr, int n):STATE;
	@:native("") static public function mvwin_wchstr(WINDOW *win, int y, int x, cchar_t *wchstr):STATE;
	@:native("") static public function mvwin_wchnstr(WINDOW *win, int y, int x, cchar_t *wchstr, int n):STATE;

	/* curs_inch(3X)*/
       chtype inch(void);
       chtype winch(WINDOW *win);
       chtype mvinch(int y, int x);
       chtype mvwinch(WINDOW *win, int y, int x);

	/* curs_inchstr(3X)*/
	@:native("") static public function inchstr(chtype *chstr):Int;
	@:native("") static public function inchnstr(chtype *chstr, int n):Int;
	@:native("") static public function winchstr(WINDOW *win, chtype *chstr):Int;
	@:native("") static public function winchnstr(WINDOW *win, chtype *chstr, int n):Int;
	@:native("") static public function mvinchstr(int y, int x, chtype *chstr):Int;
	@:native("") static public function mvinchnstr(int y, int x, chtype *chstr, int n):Int;
	@:native("") static public function mvwinchstr(WINDOW *win, int y, int x, chtype *chstr):Int;
	@:native("") static public function mvwinchnstr(WINDOW *win, int y, int x, chtype *chstr, int n):Int;

	/* curs_instr(3X)*/
	@:native("") static public function instr(char *str):Int;
	@:native("") static public function innstr(char *str, int n):Int;
	@:native("") static public function winstr(WINDOW *win, char *str):Int;
	@:native("") static public function winnstr(WINDOW *win, char *str, int n):Int;
	@:native("") static public function mvinstr(int y, int x, char *str):Int;
	@:native("") static public function mvinnstr(int y, int x, char *str, int n):Int;
	@:native("") static public function mvwinstr(WINDOW *win, int y, int x, char *str):Int;
	@:native("") static public function mvwinnstr(WINDOW *win, int y, int x, char *str, int n):Int;

	/* curs_inwstr(3X)*/
	@:native("") static public function inwstr(wchar_t *str):Int;
	@:native("") static public function innwstr(wchar_t *str, int n):Int;
	@:native("") static public function winwstr(WINDOW *win, wchar_t *str):Int;
	@:native("") static public function winnwstr(WINDOW *win, wchar_t *str, int n):Int;
	@:native("") static public function mvinwstr(int y, int x, wchar_t *str):Int;
	@:native("") static public function mvinnwstr(int y, int x, wchar_t *str, int n):Int;
	@:native("") static public function mvwinwstr(WINDOW *win, int y, int x, wchar_t *str):Int;
	@:native("") static public function mvwinnwstr(WINDOW *win, int y, int x, wchar_t *str, int n):Int;

	/* curs_ins_wstr(3X)*/
	@:native("") static public function ins_wstr(const wchar_t *wstr):STATE;
	@:native("") static public function ins_nwstr(const wchar_t *wstr, int n):STATE;
	@:native("") static public function wins_wstr(WINDOW *win, const wchar_t *wstr):STATE;
	@:native("") static public function wins_nwstr(WINDOW *win, const wchar_t *wstr, int n):STATE;
	@:native("") static public function mvins_wstr(int y, int x, const wchar_t *wstr):STATE;
	@:native("") static public function mvins_nwstr(int y, int x, const wchar_t *wstr, int n):STATE;
	@:native("") static public function mvwins_wstr(WINDOW *win, int y, int x, const wchar_t *wstr):STATE;
	@:native("") static public function mvwins_nwstr(WINDOW *win, int y, int x, const wchar_t *wstr, int n):STATE;

	/* curs_ins_wch(3X)*/
	@:native("") static public function ins_wch(const cchar_t *wch):STATE;
	@:native("") static public function wins_wch(WINDOW *win, const cchar_t *wch):STATE;
	@:native("") static public function mvins_wch(int y, int x, const cchar_t *wch):STATE;
	@:native("") static public function mvwins_wch(WINDOW *win, int y, int x, const cchar_t *wch):STATE;

	/* curs_insch(3X)*/
	@:native("") static public function insch(chtype ch):STATE;
	@:native("") static public function winsch(WINDOW *win, chtype ch):STATE;
	@:native("") static public function mvinsch(int y, int x, chtype ch):STATE;
	@:native("") static public function mvwinsch(WINDOW *win, int y, int x, chtype ch):STATE;

	/* curs_insstr(3X)*/
	@:native("") static public function insstr(const char *str):STATE;
	@:native("") static public function insnstr(const char *str, int n):STATE;
	@:native("") static public function winsstr(WINDOW *win, const char *str):STATE;
	@:native("") static public function winsnstr(WINDOW *win, const char *str, int n):STATE;
	@:native("") static public function mvinsstr(int y, int x, const char *str):STATE;
	@:native("") static public function mvinsnstr(int y, int x, const char *str, int n):STATE;
	@:native("") static public function mvwinsstr(WINDOW *win, int y, int x, const char *str):STATE;
	@:native("") static public function mvwinsnstr(WINDOW *win, int y, int x, const char *str, int n):STATE;

	/* curs_opaque(3X)**/
       bool is_cleared(const WINDOW *win);
       bool is_idcok(const WINDOW *win);
       bool is_idlok(const WINDOW *win);
       bool is_immedok(const WINDOW *win);
       bool is_keypad(const WINDOW *win);
       bool is_leaveok(const WINDOW *win);
       bool is_nodelay(const WINDOW *win);
       bool is_notimeout(const WINDOW *win);
       bool is_pad(const WINDOW *win);
       bool is_scrollok(const WINDOW *win);
       bool is_subwin(const WINDOW *win);
       bool is_syncok(const WINDOW *win);
       WINDOW * wgetparent(const WINDOW *win);
       int wgetdelay(const WINDOW *win);
       int wgetscrreg(const WINDOW *win, int *top, int *bottom);

	/* curs_touch(3X)*/
	@:native("") static public function touchwin(WINDOW *win):STATE;
	@:native("") static public function touchline(WINDOW *win, int start, int count):STATE;
	@:native("") static public function untouchwin(WINDOW *win):STATE;
	@:native("") static public function wtouchln(WINDOW *win, int y, int n, int changed):STATE;
       bool is_linetouched(WINDOW *win, int line);
       bool is_wintouched(WINDOW *win)

	/* resizeterm(3X)**/
       bool is_term_resized(int lines, int columns);
	@:native("") static public function resize_term(int lines, int columns):STATE;
	@:native("") static public function resizeterm(int lines, int columns):STATE;

/*key_defined             key_defined(3X)**/
 int key_defined(const char *definition);
/*keybound                keybound(3X)**/
 char * keybound(int keycode, int count);

/*keyok                   keyok(3X)**/
	int keyok(int keycode, bool enable);

/*mcprint                 curs_print(3X)**/
 int mcprint(char *data, int len);

	/*curs_move(3X)*/
	@:native("") static public function move(int y, int x):STATE;
	@:native("") static public function wmove(WINDOW *win, int y, int x):STATE;

	/* curs_add_wchstr(3X)*/
	@:native("") static public function add_wchstr(const cchar_t *wchstr):STATE;
	@:native("") static public function add_wchnstr(const cchar_t *wchstr, int n):STATE;
	@:native("") static public function wadd_wchstr(WINDOW * win, const cchar_t *wchstr):STATE;
	@:native("") static public function wadd_wchnstr(WINDOW * win, const cchar_t *wchstr, int n):STATE;
	@:native("") static public function mvadd_wchstr(int y, int x, const cchar_t *wchstr):STATE;
	@:native("") static public function mvadd_wchnstr(int y, int x, const cchar_t *wchstr, int n):STATE;
	@:native("") static public function mvwadd_wchstr(WINDOW *win, int y, int x, const cchar_t *wchstr):STATE;
	@:native("") static public function mvwadd_wchnstr(WINDOW *win, int y, int x, const cchar_t *wchstr, int n):STATE;

	/* curs_addchstr(3X)*/
	@:native("") static public function addchstr(const chtype *chstr):STATE;
	@:native("") static public function addchnstr(const chtype *chstr, int n):STATE;
	@:native("") static public function waddchstr(WINDOW *win, const chtype *chstr):STATE;
	@:native("") static public function waddchnstr(WINDOW *win, const chtype *chstr, int n):STATE;
	@:native("") static public function mvaddchstr(int y, int x, const chtype *chstr):STATE;
	@:native("") static public function mvaddchnstr(int y, int x, const chtype *chstr, int n):STATE;
	@:native("") static public function mvwaddchstr(WINDOW *win, int y, int x, const chtype *chstr):STATE;
	@:native("") static public function mvwaddchnstr(WINDOW *win, int y, int x, const chtype *chstr, int n):STATE;

	/* curs_printw(3X)*/
	@:native("") static public function printw(const char *fmt, ...):STATE;
	@:native("") static public function wprintw(WINDOW *win, const char *fmt, ...):STATE;
	@:native("") static public function mvprintw(int y, int x, const char *fmt, ...):STATE;
	@:native("") static public function mvwprintw(WINDOW *win, int y, int x, const char *fmt, ...):STATE;
	@:native("") static public function vwprintw(WINDOW *win, const char *fmt, va_list varglist):STATE;
	@:native("") static public function vw_printw(WINDOW *win, const char *fmt, va_list varglist):STATE;

	/* curs_scanw(3X)*/
	@:native("") static public function scanw(char *fmt, ...):Int;
	@:native("") static public function wscanw(WINDOW *win, char *fmt, ...):Int;
	@:native("") static public function mvscanw(int y, int x, char *fmt, ...):Int;
	@:native("") static public function mvwscanw(WINDOW *win, int y, int x, char *fmt, ...):Int;
	@:native("") static public function vw_scanw(WINDOW *win, char *fmt, va_list varglist):Int;
	@:native("") static public function vwscanw(WINDOW *win, char *fmt, va_list varglist):Int;

	/* curs_pad(3X)*/
       WINDOW *newpad(int nlines, int ncols);
       WINDOW *subpad(WINDOW *orig, int nlines, int ncols,
             int begin_y, int begin_x);
	@:native("") static public function prefresh(WINDOW *pad, int pminrow, int pmincol,
             int sminrow, int smincol, int smaxrow, int smaxcol):STATE;
	@:native("") static public function pnoutrefresh(WINDOW *pad, int pminrow, int pmincol,
             int sminrow, int smincol, int smaxrow, int smaxcol):STATE;
	@:native("") static public function pechochar(WINDOW *pad, chtype ch):STATE;
	@:native("") static public function pecho_wchar(WINDOW *pad, const cchar_t *wch):STATE;

	/*curs_scr_dump(3X)*/
	@:native("") static public function scr_dump(const char *filename):STATE;
	@:native("") static public function scr_restore(const char *filename):STATE;
	@:native("") static public function scr_init(const char *filename):STATE;
	@:native("") static public function scr_set(const char *filename):STATE;

	/* curs_scroll(3X)*/
	@:native("") static public function scroll(WINDOW *win):STATE;
	@:native("") static public function scrl(int n):STATE;
	@:native("") static public function wscrl(WINDOW *win, int n):STATE;

	/* curs_slk(3X)**/
	@:native("") static public function slk_init(int fmt):STATE;
	@:native("") static public function slk_set(int labnum, const char *label, int fmt):STATE;
	@:native("") static public function slk_refresh(void):STATE;
	@:native("") static public function slk_noutrefresh(void):STATE;
       char *slk_label(int labnum);
	@:native("") static public function slk_clear(void):STATE;
	@:native("") static public function slk_restore(void):STATE;
	@:native("") static public function slk_touch(void):STATE;
	@:native("") static public function slk_attron(const chtype attrs):STATE;
	@:native("") static public function slk_attroff(const chtype attrs):STATE;
	@:native("") static public function slk_attrset(const chtype attrs):STATE;
	@:native("") static public function slk_attr_on(attr_t attrs, void* opts):STATE;
	@:native("") static public function slk_attr_off(const attr_t attrs, void * opts):STATE;
	@:native("") static public function slk_attr_set(const attr_t attrs, short color_pair, void* opts):STATE;
       attr_t slk_attr(void);
	@:native("") static public function slk_color(short color_pair):STATE;
	@:native("") static public function slk_wset(int labnum, const wchar_t *label, int fmt):STATE;

	/* curs_termcap(3X)*/
	@:native("") static public function tgetent(char *bp, const char *name):STATE;
	@:native("") static public function tgetflag(char *id):STATE;
	@:native("") static public function tgetnum(char *id):STATE;
       char *tgetstr(char *id, char **area);
       char *tgoto(const char *cap, int col, int row);
	@:native("") static public function tputs(const char *str, int affcnt, int (*putc)(int)):STATE;

	/* wresize(3X)**/
	@:native("") static public function wresize(WINDOW *win, int lines, int columns):STATE;

}

@:enum extern abstract STATE(Int){
	@:native("ERR") var ERR;
	@:native("OK") var OK;
}

@:enum extern abstract COLOR(Int) to Int{
	@:native("COLOR_BLACK") var COLOR_BLACK;
	@:native("COLOR_RED") var COLOR_RED;
	@:native("COLOR_GREEN") var COLOR_GREEN;
	@:native("COLOR_YELLOW") var COLOR_YELLOW;
	@:native("COLOR_BLUE") var COLOR_BLUE;
	@:native("COLOR_MAGENTA") var COLOR_MAGENTA;
	@:native("COLOR_CYAN") var COLOR_CYAN;
	@:native("COLOR_WHITE") var COLOR_WHITE;
}

@:enum extern abstract ATTRS(Int) to Int{
	@:native("A_NORMAL") var A_NORMAL;       //Normal display (no highlight)
	@:native("A_STANDOUT") var A_STANDOUT;     //Best highlighting mode of the terminal.
	@:native("A_UNDERLINE") var A_UNDERLINE;    //Underlining
	@:native("A_REVERSE") var A_REVERSE;      //Reverse video
	@:native("A_BLINK") var A_BLINK;        //Blinking
	@:native("A_DIM") var A_DIM;          //Half bright
	@:native("A_BOLD") var A_BOLD;         //Extra bright or bold
	@:native("A_PROTECT") var A_PROTECT;      //Protected mode
	@:native("A_INVIS") var A_INVIS;        //Invisible or blank mode
	@:native("A_ALTCHARSET") var A_ALTCHARSET;   //Alternate character set
	@:native("A_ITALIC") var A_ITALIC;       //Italics (non-X/Open extension)
	@:native("A_CHARTEXT") var A_CHARTEXT;     //Bit-mask to extract a character
	//@:native("") var COLOR_PAIR;(n)  //Color-pair number n
}

@:enum extern abstract HIGHLIGHT(Int) to Int{
	@:native("WA_HORIZONTAL") var WA_HORIZONTAL;  //Horizontal highlight
	@:native("WA_LEFT") var WA_LEFT;        //Left highlight
	@:native("WA_LOW") var WA_LOW;         //Low highlight
	@:native("WA_RIGHT") var WA_RIGHT;       //Right highlight
	@:native("WA_TOP") var WA_TOP;         //Top highlight
	@:native("WA_VERTICAL") var WA_VERTICAL;    //Vertical highlight
}
