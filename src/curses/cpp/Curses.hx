package curses.cpp;

import cpp.Char;
import cpp.Pointer;
import cpp.ConstPointer;
import cpp.UInt32;
import cpp.Int32 as Short;
import haxe.extern.Rest; 

typedef Attrs = Int; 			// attr_t
typedef Null = Pointer<cpp.Void>; // void*, but should always be 0.
typedef CHType = Int; 		// chtype_t
//@:native("cchar_t") typedef CChar_t = Int; 		// cchar_t

@:enum abstract CONSTS(Null) to Null{ var Nothing = null; }

@:include("curses.h") 
@:buildXml("
<target id=\"haxe\">
	<lib name='-lncurses'/>
</target>
")
@:final extern class Curses{

	@:native("COLOR_PAIR") static public function color_pair(n:Int):Int;

	@:native("initscr") static public function initscr():Pointer<Window>;
	@:native("mvaddstr") static public function mvaddstr(y:Int,x:Int,str:String):Void;
	@:native("refresh") static public function refresh():Void;
	@:native("delwin") static public function delwin(w:Pointer<Window>):Void;
	@:native("endwin") static public function endwin():Void;

	/* curs_color(3x) */
	@:native("start_color") static public function start_color():STATE;
	@:native("init_pair") static public function init_pair(pair:Short, f:Short, b:Short):STATE;
	@:native("init_color") static public function init_color(color:Short, r:Short, g:Short, b:Short):STATE;
	@:native("has_colors") static public function has_colors():Bool;
	@:native("can_change_color") static public function can_change_color():Bool;
	@:native("color_content") static public function color_content(color:Short, r:Pointer<Short>, g:Pointer<Short>, b:Pointer<Short>):STATE;
	@:native("pair_content") static public function pair_content(pair:Short, f:Pointer<Short>, b:Pointer<Short>):STATE;

	/* curs_attr */
	@:native("attroff") static public function attroff(attrs:Int):STATE;
	@:native("wattroff") static public function wattroff(win:Pointer<Window>, attrs:Attrs):STATE;
	@:native("attron") static public function attron(attrs:Int):STATE;
	@:native("wattron") static public function wattron(win:Pointer<Window>, attrs:Attrs):STATE;
	@:native("attrset") static public function attrset(attrs:Int):STATE;
	@:native("wattrset") static public function wattrset(win:Pointer<Window>, attrs:Attrs):STATE;
	@:native("color_set") static public function color_set(color_pair_number:Short, opts:Null):STATE;
	@:native("wcolor_set") static public function wcolor_set(win:Pointer<Window>, color_pair_number:Short, opts:Null):STATE;
	@:native("standend") static public function standend():STATE;
	@:native("wstandend") static public function wstandend(win:Pointer<Window>):STATE;
	@:native("standout") static public function standout():STATE;
	@:native("wstandout") static public function wstandout(win:Pointer<Window>):STATE;
	@:native("attr_get") static public function attr_get(attrs:Pointer<Attrs>, pair:Pointer<Short>, opts:Null):STATE;
	@:native("wattr_get") static public function wattr_get(win:Pointer<Window>, attrs:Pointer<Attrs>, pair:Pointer<Short>, opts:Null):STATE;
	@:native("attr_off") static public function attr_off(attrs:Attrs, opts:Null):STATE;
	@:native("wattr_off") static public function wattr_off(win:Pointer<Window>, attrs:Attrs, opts:Null):STATE;
	@:native("attr_on") static public function attr_on(attrs:Attrs, opts:Null):STATE;
	@:native("wattr_on") static public function wattr_on(win:Pointer<Window>, attrs:Attrs, opts:Null):STATE;
	@:native("attr_set") static public function attr_set(attrs:Attrs, pair:Short, opts:Null):STATE;
	@:native("wattr_set") static public function wattr_set(win:Pointer<Window>, attrs:Attrs, pair:Short, opts:Null):STATE;
	@:native("chgat") static public function chgat(n:Int, attr:Attrs, color:Short, opts:Null):STATE;
	@:native("wchgat") static public function wchgat(win:Pointer<Window>, n:Int, attr:Attrs, color:Short, opts:Null):STATE;
	@:native("mvchgat") static public function mvchgat(y:Int, x:Int, n:Int, attr:Attrs, color:Short, opts:Null):STATE;
	@:native("mvwchgat") static public function mvwchgat(win:Pointer<Window>, y:Int, x:Int, n:Int, attr:Attrs, color:Short, opts:Null):STATE;
	
	/* curs_memleaks(3X)*/
	@:native("_nc_freeall") static public function _nc_freeall():Void;
	@:native("_nc_free_and_exit") static public function _nc_free_and_exit(x:Int):Void;

	/* curs_trace(3X)**/
	@:native("_tracef") static public function _tracef(format:ConstPointer<Char>, vs:Rest<Dynamic>):Void;
	@:native("_tracedump") static public function _tracedump(label:ConstPointer<Char>, win:Pointer<Window>):Void;
	@:native("_traceattr") static public function _traceattr(attr:Attrs):Pointer<Char>;
	@:native("_traceattr2") static public function _traceattr2(buffer:Int, ch:CHType):Pointer<Char>;
	@:native("_nc_tracebits") static public function _nc_tracebits():Pointer<Char>;
	@:native(" _tracecchar_t") static public function  _tracecchar_t(string:ConstPointer<CChar_t>):Pointer<Char>;
	@:native(" _tracecchar_t2") static public function  _tracecchar_t2(buffer:Int, string:ConstPointer<CChar_t>):Pointer<Char>;
	@:native("_tracechar") static public function _tracechar(ch:Int):Pointer<Char>;
	@:native("_tracechtype") static public function _tracechtype(ch:CHType):Pointer<Char>;
	@:native("_tracechtype2") static public function _tracechtype2(buffer:Int, ch:CHType):Pointer<Char>;
	@:native("_tracemouse") static public function _tracemouse(event:ConstPointer<MEVENT>):Pointer<Char>;
	@:native("trace") static public function _trace(param:TRACE_PARAM):Void;

	/* curs_add_wch(3X)*/
	@:native("add_wch") static public function add_wch(wch:ConstPointer<CChar_t>):STATE;
	@:native("wadd_wch") static public function wadd_wch(win:Pointer<Window>, wch:ConstPointer<CChar_t>):STATE;
	@:native("mvadd_wch") static public function mvadd_wch(y:Int, x:Int, wch:ConstPointer<CChar_t>):STATE;
	@:native("mvwadd_wch") static public function mvwadd_wch(win:Pointer<Window>, y:Int, x:Int, wch:ConstPointer<CChar_t>):STATE;
	@:native("echo_wchar") static public function echo_wchar(wch:ConstPointer<CChar_t>):STATE;
	@:native("wecho_wchar") static public function wecho_wchar(win:Pointer<Window>, wch:ConstPointer<CChar_t>):STATE;

// /* curs_addch(3X)*/
//	@:native("") static public function addch(const chtype ch):STATE;
//	@:native("") static public function waddch(win:Pointer<Window>, const chtype ch):STATE;
//	@:native("") static public function mvaddch(int y, int x, const chtype ch):STATE;
//	@:native("") static public function mvwaddch(win:Pointer<Window>, int y, int x, const chtype ch):STATE;
//	@:native("") static public function echochar(const chtype ch):STATE;
//	@:native("") static public function wechochar(win:Pointer<Window>, const chtype ch):STATE;
//
// /* curs_addchstr(3X)*/
//	@:native("") static public function addchstr(const chstr:Pointer<CHType>):STATE;
//	@:native("") static public function addchnstr(const chstr:Pointer<CHType>, int n):STATE;
//	@:native("") static public function waddchstr(win:Pointer<Window>, const chstr:Pointer<CHType>):STATE;
//	@:native("") static public function waddchnstr(win:Pointer<Window>, const chstr:Pointer<CHType>, int n):STATE;
//	@:native("") static public function mvaddchstr(int y, int x, const chstr:Pointer<CHType>):STATE;
//	@:native("") static public function mvaddchnstr(int y, int x, const chstr:Pointer<CHType>, int n):STATE;
//	@:native("") static public function mvwaddchstr(win:Pointer<Window>, int y, int x, const chstr:Pointer<CHType>):STATE;
//	@:native("") static public function mvwaddchnstr(win:Pointer<Window>, int y, int x, const chstr:Pointer<CHType>, int n):STATE;
//
// /* curs_addstr(3X)*/
//	@:native("") static public function addstr(str:ConstPointer<Char>):STATE;
//	@:native("") static public function addnstr(str:ConstPointer<Char>, int n):STATE;
//	@:native("") static public function waddstr(win:Pointer<Window>, str:ConstPointer<Char>):STATE;
//	@:native("") static public function waddnstr(win:Pointer<Window>, str:ConstPointer<Char>, int n):STATE;
//	@:native("") static public function mvaddstr(int y, int x, str:ConstPointer<Char>):STATE;
//	@:native("") static public function mvaddnstr(int y, int x, str:ConstPointer<Char>, int n):STATE;
//	@:native("") static public function mvwaddstr(win:Pointer<Window>, int y, int x, str:ConstPointer<Char>):STATE;
//	@:native("") static public function mvwaddnstr(win:Pointer<Window>, int y, int x, str:ConstPointer<Char>, int n):STATE;
//
// /* curs_addwstr(3X)*/
//	@:native("") static public function addwstr(const wchar_t *wstr):STATE;
//	@:native("") static public function addnwstr(const wchar_t *wstr, int n):STATE;
//	@:native("") static public function waddwstr(win:Pointer<Window>, const wchar_t *wstr):STATE;
//	@:native("") static public function waddnwstr(win:Pointer<Window>, const wchar_t *wstr, int n):STATE;
//	@:native("") static public function mvaddwstr(int y, int x, const wchar_t *wstr):STATE;
//	@:native("") static public function mvaddnwstr(int y, int x, const wchar_t *wstr, int n):STATE;
//	@:native("") static public function mvwaddwstr(win:Pointer<Window>, int y, int x, const wchar_t *wstr):STATE;
//	@:native("") static public function mvwaddnwstr(win:Pointer<Window>, int y, int x, const wchar_t *wstr, int n):STATE;
//
// /* default_colors(3X)**/
//	@:native("") static public function use_default_colors():STATE;
//	@:native("") static public function assume_default_colors(int fg, int bg):STATE;
//
// /* curs_termattrs(3X)*/
//	@:native("") static public function baudrate():STATE;
//		 char erasechar();
//	@:native("") static public function erasewchar(wchar_t *ch):STATE;
//		 bool has_ic();
//		 bool has_il();
//		 char killchar();
//	@:native("") static public function killwchar(wchar_t *ch):STATE;
//		 char *longname();
//		 term_attrs:Attrs();
//		 chtype termattrs();
//		 char *termname();
//
// /* curs_beep(3X)*/
//	@:native("") static public function beep():STATE;
//	@:native("") static public function flash():STATE;
//
 /* curs_bkgd(3X)*/
  @:native("bkgdset") static public function bkgdset(ch:CHType):Void;
  @:native("wbkgdset") static public function wbkgdset(win:Pointer<Window>, ch:CHType):Void;
	@:native("bkgd") static public function bkgd(ch:CHType):STATE;
	@:native("wbkgd") static public function wbkgd(win:Pointer<Window>, ch:CHType):STATE;
  @:native("getbkgd") static public function getbkgd(win:Pointer<Window>):CHType;
//
// /* curs_bkgrnd(3X)*/
//	@:native("") static public function bkgrnd( wch:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function wbkgrnd( win:Pointer<Window>, wch:ConstPointer<CChar_t>):STATE;
//       void bkgrndset(wch:ConstPointer<CChar_t> );
//       void wbkgrndset(win:Pointer<Window>, wch:ConstPointer<CChar_t>);
//	@:native("") static public function getbkgrnd(cchar_t *wch):STATE;
//	@:native("") static public function wgetbkgrnd(win:Pointer<Window>, cchar_t *wch):STATE;
//
// /* curs_border(3X)*/
//	@:native("") static public function border(chtype ls, chtype rs, chtype ts, chtype bs, chtype tl, chtype tr, chtype bl, chtype br):STATE;
//	@:native("") static public function wborder(win:Pointer<Window>, chtype ls, chtype rs, chtype ts, chtype bs, chtype tl, chtype tr, chtype bl, chtype br):STATE;
//	@:native("") static public function box(win:Pointer<Window>, chtype verch, chtype horch):STATE;
//	@:native("") static public function hline(chtype ch, int n):STATE;
//	@:native("") static public function whline(win:Pointer<Window>, chtype ch, int n):STATE;
//	@:native("") static public function vline(chtype ch, int n):STATE;
//	@:native("") static public function wvline(win:Pointer<Window>, chtype ch, int n):STATE;
//	@:native("") static public function mvhline(int y, int x, chtype ch, int n):STATE;
//	@:native("") static public function mvwhline(WINDOW *, int:Pointer<Window> y, int x, chtype ch, int n):STATE;
//	@:native("") static public function mvvline(int y, int x, chtype ch, int n):STATE;
//	@:native("") static public function mvwvline(WINDOW *, int:Pointer<Window> y, int x, chtype ch, int n):STATE;
//
// /* curs_border_set(3X)*/
//	@:native("") static public function border_set(
//			  ls:ConstPointer<CChar_t>, rs:ConstPointer<CChar_t>,
//			  ts:ConstPointer<CChar_t>, bs:ConstPointer<CChar_t>,
//			  tl:ConstPointer<CChar_t>, tr:ConstPointer<CChar_t>,
//			  bl:ConstPointer<CChar_t>, br:ConstPointer<CChar_t> ):STATE;
//	@:native("") static public function wborder_set(
//				win:Pointer<Window>,
//				ls:ConstPointer<CChar_t>, rs:ConstPointer<CChar_t>,
//				ts:ConstPointer<CChar_t>, bs:ConstPointer<CChar_t>,
//				tl:ConstPointer<CChar_t>, tr:ConstPointer<CChar_t>, 
//				bl:ConstPointer<CChar_t>, br:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function box_set(win:Pointer<Window>, verch:ConstPointer<CChar_t>, horch:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function hline_set(wch:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function whline_set(win:Pointer<Window>, wch:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function mvhline_set(int y, int x, wch:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function mvwhline_set(win:Pointer<Window>, int y, int x, wch:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function vline_set(wch:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function wvline_set(win:Pointer<Window>, wch:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function mvvline_set(int y, int x, wch:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function mvwvline_set(win:Pointer<Window>, int y, int x, wch:ConstPointer<CChar_t>, int n):STATE;
//
//
// /* curs_inopts(3X)*/
//	@:native("") static public function cbreak():STATE;
//	@:native("") static public function nocbreak():STATE;
//	@:native("") static public function echo():STATE;
//	@:native("") static public function noecho():STATE;
//	@:native("") static public function halfdelay(int tenths):STATE;
//	@:native("") static public function intrflush(win:Pointer<Window>, bool bf):STATE;
//	@:native("") static public function keypad(win:Pointer<Window>, bool bf):STATE;
//	@:native("") static public function meta(win:Pointer<Window>, bool bf):STATE;
//	@:native("") static public function nodelay(win:Pointer<Window>, bool bf):STATE;
//	@:native("") static public function raw():STATE;
//	@:native("") static public function noraw():STATE;
//		 void noqiflush();
//		 void qiflush();
//	@:native("") static public function notimeout(win:Pointer<Window>, bool bf):STATE;
//		 void timeout(int delay);
//		 void wtimeout(win:Pointer<Window>, int delay);
//	@:native("") static public function typeahead(int fd):STATE;
//
// /* curs_clear(3X)*/
//	@:native("") static public function erase():STATE;
//	@:native("") static public function werase(win:Pointer<Window>):STATE;
//	@:native("") static public function clear():STATE;
//	@:native("") static public function wclear(win:Pointer<Window>):STATE;
//	@:native("") static public function clrtobot():STATE;
//	@:native("") static public function wclrtobot(win:Pointer<Window>):STATE;
//	@:native("") static public function clrtoeol():STATE;
//	@:native("") static public function wclrtoeol(win:Pointer<Window>):STATE;
//
// /* curs_outopts(3X)*/
//	@:native("") static public function clearok(win:Pointer<Window>, bool bf):STATE;
//	@:native("") static public function idlok(win:Pointer<Window>, bool bf):STATE;
//       void idcok(win:Pointer<Window>, bool bf);
//       void immedok(win:Pointer<Window>, bool bf);
//	@:native("") static public function leaveok(win:Pointer<Window>, bool bf):STATE;
//	@:native("") static public function setscrreg(int top, int bot):STATE;
//	@:native("") static public function wsetscrreg(win:Pointer<Window>, int top, int bot):STATE;
//	@:native("") static public function scrollok(win:Pointer<Window>, bool bf):STATE;
//	@:native("") static public function nl():STATE;
//	@:native("") static public function nonl():STATE;
//
// /* curs_overlay(3X)*/
//	@:native("") static public function overlay(const WINDOW *srcwin:Pointer<Window>, WINDOW *dstwin:Pointer<Window>):STATE;
//	@:native("") static public function overwrite(const WINDOW *srcwin:Pointer<Window>, WINDOW *dstwin:Pointer<Window>):STATE;
//	@:native("") static public function copywin(const WINDOW *srcwin:Pointer<Window>, WINDOW *dstwin:Pointer<Window>, int sminrow,
//             int smincol, int dminrow, int dmincol, int dmaxrow,
//             int dmaxcol, int overlay):STATE;
//
// /* curs_kernel(3X)*/
//	@:native("") static public function def_prog_mode():STATE;
//	@:native("") static public function def_shell_mode():STATE;
//	@:native("") static public function reset_prog_mode():STATE;
//	@:native("") static public function reset_shell_mode():STATE;
//	@:native("") static public function resetty():STATE;
//	@:native("") static public function savetty():STATE;
//       void getsyx(int y, int x);
//       void setsyx(int y, int x);
//	@:native("") static public function ripoffline(int line, int (*init)(WINDOW *, int:Pointer<Window>)):STATE;
//	@:native("") static public function curs_set(int visibility):STATE;
//	@:native("") static public function napms(int ms):STATE;
//
// /* curs_extend(3X)**/
// const char * curses_version();
// @:native("") static public function use_extended_names(bool enable):STATE;
//
// /*define_key              define_key(3X)**/
//	@:native("") static public function define_key(const char *definition, int keycode):STATE;
//
// /* curs_terminfo(3X)*/
//	@:native("") static public function setupterm(char *term, int fildes, int *errret):STATE;
//	@:native("") static public function setterm(char *term):STATE;
//       TERMINAL *set_curterm(TERMINAL *nterm);
//	@:native("") static public function del_curterm(TERMINAL *oterm):STATE;
//	@:native("") static public function restartterm(char *term, int fildes, int *errret):STATE;
//       char *tparm(char *str, ...);
//	@:native("") static public function tputs(const char *str, int affcnt, int (*putc)(int)):STATE;
//	@:native("") static public function putp(const char *str):STATE;
//	@:native("") static public function vidputs(chtype attrs, int (*putc)(int)):STATE;
//	@:native("") static public function vidattr(chtype attrs):STATE;
//	@:native("") static public function vid_puts(attrs:Attrs, pair:Short, void *opts, int (*putc)(int)):STATE;
//	@:native("") static public function vid_attr(attrs:Attrs, pair:Short, void *opts):STATE;
//	@:native("") static public function mvcur(int oldrow, int oldcol, int newrow, int newcol):STATE;
//	@:native("") static public function tigetflag(char *capname):STATE;
//	@:native("") static public function tigetnum(char *capname):STATE;
//       char *tigetstr(char *capname);
//       char *tiparm(const char *str, ...);
//
// /* curs_util(3X)*/
//       char *unctrl(chtype c);
//       wchar_t *wunctrl(cchar_t *c);
//       char *keyname(int c);
//       char *key_name(wchar_t w);
//       void filter();
//       void nofilter();
//       void use_env(bool f);
//       void use_tioctl(bool f);
//	@:native("") static public function putwin(win:Pointer<Window>, FILE *filep):STATE;
//       WINDOW *getwin:Pointer<Window>(FILE *filep);
//	@:native("") static public function delay_output(int ms):STATE;
//       int flushinp();
//
// /* curs_delch(3X)*/
//	@:native("") static public function delch():STATE;
//	@:native("") static public function wdelch(win:Pointer<Window>):STATE;
//	@:native("") static public function mvdelch(int y, int x):STATE;
//	@:native("") static public function mvwdelch(win:Pointer<Window>, int y, int x):STATE;
//
// /* curs_deleteln(3X)*/
//	@:native("") static public function deleteln():STATE;
//	@:native("") static public function wdeleteln(win:Pointer<Window>):STATE;
//	@:native("") static public function insdelln(int n):STATE;
//	@:native("") static public function winsdelln(win:Pointer<Window>, int n):STATE;
//	@:native("") static public function insertln():STATE;
//	@:native("") static public function winsertln(win:Pointer<Window>)::STATE;
//
// /* curs_initscr(3X)*/
//       WINDOW *initscr();
//	@:native("") static public function endwin():STATE;
//       bool isendwin();
//       SCREEN *newterm(char *type, FILE *outfd, FILE *infd);
//       SCREEN *set_term(SCREEN *new);
//       void delscreen(SCREEN* sp);
//
// /* curs_window(3X)*/
//       WINDOW *newwin(
//             int nlines, int ncols,
//             int begin_y, int begin_x);
//	@:native("") static public function delwin(win:Pointer<Window>):STATE;
//	@:native("") static public function mvwin(win:Pointer<Window>, int y, int x):STATE;
//       WINDOW *subwin(WINDOW *orig:Pointer<Window>,
//             int nlines, int ncols,
//             int begin_y, int begin_x);
//       WINDOW *derwin(WINDOW *orig:Pointer<Window>,
//             int nlines, int ncols,
//             int begin_y, int begin_x);
//	@:native("") static public function mvderwin(win:Pointer<Window>, int par_y, int par_x):STATE;
//       WINDOW *dupwin(win:Pointer<Window>);
//       void wsyncup(win:Pointer<Window>);
//	@:native("") static public function syncok(win:Pointer<Window>, bool bf):STATE;
//       void wcursyncup(win:Pointer<Window>);
//       void wsyncdown(win:Pointer<Window>);
//
//	/* curs_refresh(3X)*/
//	@:native("") static public function refresh():STATE;
//	@:native("") static public function wrefresh(win:Pointer<Window>):STATE;
//	@:native("") static public function wnoutrefresh(win:Pointer<Window>):STATE;
//	@:native("") static public function doupdate():STATE;
//	@:native("") static public function redrawwin(win:Pointer<Window>):STATE;
//	@:native("") static public function wredrawln(win:Pointer<Window>, int beg_line, int num_lines):STATE;
//
//	/* curs_get_wch(3X)*/
//	@:native("") static public function get_wch(wint_t *wch):Int;
//	@:native("") static public function wget_wch(win:Pointer<Window>, wint_t *wch):Int;
//	@:native("") static public function mvget_wch(int y, int x, wint_t *wch):Int;
//	@:native("") static public function mvwget_wch(win:Pointer<Window>, int y, int x, wint_t *wch):Int;
//	@:native("") static public function unget_wch(const wchar_t wch):Int;
//
//	/* curs_get_wstr(3X)*/
//	@:native("") static public function get_wstr(wint_t *wstr):STATE;
//	@:native("") static public function getn_wstr(wint_t *wstr, int n):STATE;
//	@:native("") static public function wget_wstr(win:Pointer<Window>, wint_t *wstr):STATE;
//	@:native("") static public function wgetn_wstr(win:Pointer<Window>, wint_t *wstr, int n):STATE;
//	@:native("") static public function mvget_wstr(int y, int x, wint_t *wstr):STATE;
//	@:native("") static public function mvgetn_wstr(int y, int x, wint_t *wstr, int n):STATE;
//	@:native("") static public function mvwget_wstr(win:Pointer<Window>, int y, int x, wint_t *wstr):STATE;
//	@:native("") static public function mvwgetn_wstr(win:Pointer<Window>, int y, int x, wint_t *wstr, int n):STATE;
//
///*getbegx                 curs_legacy(3X)**/
///*getbegy                 curs_legacy(3X)**/
///*getcurx                 curs_legacy(3X)**/
///*getcury                 curs_legacy(3X)**/
///*getmaxx                 curs_legacy(3X)**/
///*getmaxy                 curs_legacy(3X)**/
///*getparx                 curs_legacy(3X)**/
///*getpary                 curs_legacy(3X)**/
//
///* curs_getyx(3X)*/
//	 void getyx(win:Pointer<Window>, int y, int x);
//	 void getparyx(win:Pointer<Window>, int y, int x);
//	 void getbegyx(win:Pointer<Window>, int y, int x);
//	 void getmaxyx(win:Pointer<Window>, int y, int x);
//
///* curs_getcchar(3X)*/
//	 int getcchar(
//					 wcval:ConstPointer<CChar_t>,
//					 wchar_t *wch,
//					 attrs:Pointer<Attrs>,
//					 color_pair:Pointer<Short>,
//					 void *opts );
//	 int setcchar(
//					 cchar_t *wcval,
//					 const wchar_t *wch,
//					 const attrs:Attrs,
//					 color_pair:Short,
//					 void *opts );
//
//
///* curs_getch(3X)*/
//       int getch();
//       int wgetch(win:Pointer<Window>);
//       int mvgetch(int y, int x);
//       int mvwgetch(win:Pointer<Window>, int y, int x);
//       int ungetch(int ch);
//       int has_key(int ch);
//
///* curs_mouse(3X)**/
//		 typedef unsigned long mmask_t;
//
//		 bool has_mouse();
//	@:native("") static public function getmouse(MEVENT *event):STATE;
//	@:native("") static public function ungetmouse(MEVENT *event):STATE;
//		 mmask_t mousemask(mmask_t newmask, mmask_t *oldmask);
//		 bool wenclose(const win:Pointer<Window>, int y, int x);
//		 bool mouse_trafo(int* pY, int* pX, bool to_screen);
//		 bool wmouse_trafo(const WINDOW* win, int* pY, int* pX,
//					bool to_screen);
//		 int mouseinterval(int erval);
//
//
//	/* curs_getstr(3X)*/
//	@:native("") static public function getstr(char *str):STATE;
//	@:native("") static public function getnstr(char *str, int n):STATE;
//	@:native("") static public function wgetstr(win:Pointer<Window>, char *str):STATE;
//	@:native("") static public function wgetnstr(win:Pointer<Window>, char *str, int n):STATE;
//	@:native("") static public function mvgetstr(int y, int x, char *str):STATE;
//	@:native("") static public function mvwgetstr(win:Pointer<Window>, int y, int x, char *str):STATE;
//	@:native("") static public function mvgetnstr(int y, int x, char *str, int n):STATE;
//	@:native("") static public function mvwgetnstr(WINDOW *, int:Pointer<Window> y, int x, char *str, int n):STATE;
//
//	/* curs_in_wch(3X)*/
//	@:native("") static public function in_wch(cchar_t *wcval):STATE;
//	@:native("") static public function mvin_wch(int y, int x, cchar_t *wcval):STATE;
//	@:native("") static public function mvwin_wch(win:Pointer<Window>, int y, int x, cchar_t *wcval):STATE;
//	@:native("") static public function win_wch(win:Pointer<Window>, cchar_t *wcval):STATE;
//
//	/* curs_in_wchstr(3X)*/
//	@:native("") static public function in_wchstr(cchar_t *wchstr):STATE;
//	@:native("") static public function in_wchnstr(cchar_t *wchstr, int n):STATE;
//	@:native("") static public function win_wchstr(win:Pointer<Window>, cchar_t *wchstr):STATE;
//	@:native("") static public function win_wchnstr(win:Pointer<Window>, cchar_t *wchstr, int n):STATE;
//	@:native("") static public function mvin_wchstr(int y, int x, cchar_t *wchstr):STATE;
//	@:native("") static public function mvin_wchnstr(int y, int x, cchar_t *wchstr, int n):STATE;
//	@:native("") static public function mvwin_wchstr(win:Pointer<Window>, int y, int x, cchar_t *wchstr):STATE;
//	@:native("") static public function mvwin_wchnstr(win:Pointer<Window>, int y, int x, cchar_t *wchstr, int n):STATE;
//
//	/* curs_inch(3X)*/
//       chtype inch();
//       chtype winch(win:Pointer<Window>);
//       chtype mvinch(int y, int x);
//       chtype mvwinch(win:Pointer<Window>, int y, int x);
//
//	/* curs_inchstr(3X)*/
//	@:native("") static public function inchstr(chstr:Pointer<CHType>):Int;
//	@:native("") static public function inchnstr(chstr:Pointer<CHType>, int n):Int;
//	@:native("") static public function winchstr(win:Pointer<Window>, chstr:Pointer<CHType>):Int;
//	@:native("") static public function winchnstr(WINDOW *win, chstr:Pointer<CHType>, int n):Int;
//	@:native("") static public function mvinchstr(int y, int x, chstr:Pointer<CHType>):Int;
//	@:native("") static public function mvinchnstr(int y, int x, chstr:Pointer<CHType>, int n):Int;
//	@:native("") static public function mvwinchstr(WINDOW *win, int y, int x, chstr:Pointer<CHType>):Int;
//	@:native("") static public function mvwinchnstr(WINDOW *win, int y, int x, chstr:Pointer<CHType>, int n):Int;
//
//	/* curs_instr(3X)*/
//	@:native("") static public function instr(char *str):Int;
//	@:native("") static public function innstr(char *str, int n):Int;
//	@:native("") static public function winstr(WINDOW *win, char *str):Int;
//	@:native("") static public function winnstr(WINDOW *win, char *str, int n):Int;
//	@:native("") static public function mvinstr(int y, int x, char *str):Int;
//	@:native("") static public function mvinnstr(int y, int x, char *str, int n):Int;
//	@:native("") static public function mvwinstr(WINDOW *win, int y, int x, char *str):Int;
//	@:native("") static public function mvwinnstr(WINDOW *win, int y, int x, char *str, int n):Int;
//
//	/* curs_inwstr(3X)*/
//	@:native("") static public function inwstr(wchar_t *str):Int;
//	@:native("") static public function innwstr(wchar_t *str, int n):Int;
//	@:native("") static public function winwstr(WINDOW *win, wchar_t *str):Int;
//	@:native("") static public function winnwstr(WINDOW *win, wchar_t *str, int n):Int;
//	@:native("") static public function mvinwstr(int y, int x, wchar_t *str):Int;
//	@:native("") static public function mvinnwstr(int y, int x, wchar_t *str, int n):Int;
//	@:native("") static public function mvwinwstr(WINDOW *win, int y, int x, wchar_t *str):Int;
//	@:native("") static public function mvwinnwstr(WINDOW *win, int y, int x, wchar_t *str, int n):Int;
//
//	/* curs_ins_wstr(3X)*/
//	@:native("") static public function ins_wstr(const wchar_t *wstr):STATE;
//	@:native("") static public function ins_nwstr(const wchar_t *wstr, int n):STATE;
//	@:native("") static public function wins_wstr(WINDOW *win, const wchar_t *wstr):STATE;
//	@:native("") static public function wins_nwstr(WINDOW *win, const wchar_t *wstr, int n):STATE;
//	@:native("") static public function mvins_wstr(int y, int x, const wchar_t *wstr):STATE;
//	@:native("") static public function mvins_nwstr(int y, int x, const wchar_t *wstr, int n):STATE;
//	@:native("") static public function mvwins_wstr(WINDOW *win, int y, int x, const wchar_t *wstr):STATE;
//	@:native("") static public function mvwins_nwstr(WINDOW *win, int y, int x, const wchar_t *wstr, int n):STATE;
//
//	/* curs_ins_wch(3X)*/
//	@:native("") static public function ins_wch(wch:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function wins_wch(WINDOW *win, wch:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function mvins_wch(int y, int x, wch:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function mvwins_wch(WINDOW *win, int y, int x, wch:ConstPointer<CChar_t>):STATE;
//
//	/* curs_insch(3X)*/
//	@:native("") static public function insch(chtype ch):STATE;
//	@:native("") static public function winsch(WINDOW *win, chtype ch):STATE;
//	@:native("") static public function mvinsch(int y, int x, chtype ch):STATE;
//	@:native("") static public function mvwinsch(WINDOW *win, int y, int x, chtype ch):STATE;
//
//	/* curs_insstr(3X)*/
//	@:native("") static public function insstr(const char *str):STATE;
//	@:native("") static public function insnstr(const char *str, int n):STATE;
//	@:native("") static public function winsstr(WINDOW *win, const char *str):STATE;
//	@:native("") static public function winsnstr(WINDOW *win, const char *str, int n):STATE;
//	@:native("") static public function mvinsstr(int y, int x, const char *str):STATE;
//	@:native("") static public function mvinsnstr(int y, int x, const char *str, int n):STATE;
//	@:native("") static public function mvwinsstr(WINDOW *win, int y, int x, const char *str):STATE;
//	@:native("") static public function mvwinsnstr(WINDOW *win, int y, int x, const char *str, int n):STATE;
//
//	/* curs_opaque(3X)**/
//       bool is_cleared(const WINDOW *win);
//       bool is_idcok(const WINDOW *win);
//       bool is_idlok(const WINDOW *win);
//       bool is_immedok(const WINDOW *win);
//       bool is_keypad(const WINDOW *win);
//       bool is_leaveok(const WINDOW *win);
//       bool is_nodelay(const WINDOW *win);
//       bool is_notimeout(const WINDOW *win);
//       bool is_pad(const WINDOW *win);
//       bool is_scrollok(const WINDOW *win);
//       bool is_subwin(const WINDOW *win);
//       bool is_syncok(const WINDOW *win);
//       WINDOW * wgetparent(const WINDOW *win);
//       int wgetdelay(const WINDOW *win);
//       int wgetscrreg(const WINDOW *win, int *top, int *bottom);
//
//	/* curs_touch(3X)*/
//	@:native("") static public function touchwin(WINDOW *win):STATE;
//	@:native("") static public function touchline(WINDOW *win, int start, int count):STATE;
//	@:native("") static public function untouchwin(WINDOW *win):STATE;
//	@:native("") static public function wtouchln(WINDOW *win, int y, int n, int changed):STATE;
//       bool is_linetouched(WINDOW *win, int line);
//       bool is_wintouched(WINDOW *win)
//
//	/* resizeterm(3X)**/
//       bool is_term_resized(int lines, int columns);
//	@:native("") static public function resize_term(int lines, int columns):STATE;
//	@:native("") static public function resizeterm(int lines, int columns):STATE;
//
///*key_defined             key_defined(3X)**/
// int key_defined(const char *definition);
///*keybound                keybound(3X)**/
// char * keybound(int keycode, int count);
//
///*keyok                   keyok(3X)**/
//	int keyok(int keycode, bool enable);
//
///*mcprint                 curs_print(3X)**/
// int mcprint(char *data, int len);
//
//	/*curs_move(3X)*/
//	@:native("") static public function move(int y, int x):STATE;
//	@:native("") static public function wmove(WINDOW *win, int y, int x):STATE;
//
//	/* curs_add_wchstr(3X)*/
//	@:native("") static public function add_wchstr(wchstr:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function add_wchnstr(wchstr:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function wadd_wchstr(WINDOW * win, wchstr:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function wadd_wchnstr(WINDOW * win, wchstr:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function mvadd_wchstr(int y, int x, wchstr:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function mvadd_wchnstr(int y, int x, wchstr:ConstPointer<CChar_t>, int n):STATE;
//	@:native("") static public function mvwadd_wchstr(WINDOW *win, int y, int x, wchstr:ConstPointer<CChar_t>):STATE;
//	@:native("") static public function mvwadd_wchnstr(WINDOW *win, int y, int x, wchstr:ConstPointer<CChar_t>, int n):STATE;
//
//	/* curs_addchstr(3X)*/
//	@:native("") static public function addchstr(const chstr:Pointer<CHType>):STATE;
//	@:native("") static public function addchnstr(const chstr:Pointer<CHType>, int n):STATE;
//	@:native("") static public function waddchstr(WINDOW *win, const chstr:Pointer<CHType>):STATE;
//	@:native("") static public function waddchnstr(WINDOW *win, const chstr:Pointer<CHType>, int n):STATE;
//	@:native("") static public function mvaddchstr(int y, int x, const chstr:Pointer<CHType>):STATE;
//	@:native("") static public function mvaddchnstr(int y, int x, const chstr:Pointer<CHType>, int n):STATE;
//	@:native("") static public function mvwaddchstr(WINDOW *win, int y, int x, const chstr:Pointer<CHType>):STATE;
//	@:native("") static public function mvwaddchnstr(WINDOW *win, int y, int x, const chstr:Pointer<CHType>, int n):STATE;
//
//	/* curs_printw(3X)*/
//	@:native("") static public function printw(const char *fmt, ...):STATE;
//	@:native("") static public function wprintw(WINDOW *win, const char *fmt, ...):STATE;
//	@:native("") static public function mvprintw(int y, int x, const char *fmt, ...):STATE;
//	@:native("") static public function mvwprintw(WINDOW *win, int y, int x, const char *fmt, ...):STATE;
//	@:native("") static public function vwprintw(WINDOW *win, const char *fmt, va_list varglist):STATE;
//	@:native("") static public function vw_printw(WINDOW *win, const char *fmt, va_list varglist):STATE;
//
//	/* curs_scanw(3X)*/
//	@:native("") static public function scanw(char *fmt, ...):Int;
//	@:native("") static public function wscanw(WINDOW *win, char *fmt, ...):Int;
//	@:native("") static public function mvscanw(int y, int x, char *fmt, ...):Int;
//	@:native("") static public function mvwscanw(WINDOW *win, int y, int x, char *fmt, ...):Int;
//	@:native("") static public function vw_scanw(WINDOW *win, char *fmt, va_list varglist):Int;
//	@:native("") static public function vwscanw(WINDOW *win, char *fmt, va_list varglist):Int;
//
//	/* curs_pad(3X)*/
//       WINDOW *newpad(int nlines, int ncols);
//       WINDOW *subpad(WINDOW *orig, int nlines, int ncols,
//             int begin_y, int begin_x);
//	@:native("") static public function prefresh(WINDOW *pad, int pminrow, int pmincol,
//             int sminrow, int smincol, int smaxrow, int smaxcol):STATE;
//	@:native("") static public function pnoutrefresh(WINDOW *pad, int pminrow, int pmincol,
//             int sminrow, int smincol, int smaxrow, int smaxcol):STATE;
//	@:native("") static public function pechochar(WINDOW *pad, chtype ch):STATE;
//	@:native("") static public function pecho_wchar(WINDOW *pad, wch:ConstPointer<CChar_t>):STATE;
//
//	/*curs_scr_dump(3X)*/
//	@:native("") static public function scr_dump(const char *filename):STATE;
//	@:native("") static public function scr_restore(const char *filename):STATE;
//	@:native("") static public function scr_init(const char *filename):STATE;
//	@:native("") static public function scr_set(const char *filename):STATE;
//
//	/* curs_scroll(3X)*/
//	@:native("") static public function scroll(WINDOW *win):STATE;
//	@:native("") static public function scrl(int n):STATE;
//	@:native("") static public function wscrl(WINDOW *win, int n):STATE;
//
//	/* curs_slk(3X)**/
//	@:native("") static public function slk_init(int fmt):STATE;
//	@:native("") static public function slk_set(int labnum, const char *label, int fmt):STATE;
//	@:native("") static public function slk_refresh():STATE;
//	@:native("") static public function slk_noutrefresh():STATE;
//       char *slk_label(int labnum);
//	@:native("") static public function slk_clear():STATE;
//	@:native("") static public function slk_restore():STATE;
//	@:native("") static public function slk_touch():STATE;
//	@:native("") static public function slk_attron(const chtype attrs):STATE;
//	@:native("") static public function slk_attroff(const chtype attrs):STATE;
//	@:native("") static public function slk_attrset(const chtype attrs):STATE;
//	@:native("") static public function slk_attr_on(attrs:Attrs, void* opts):STATE;
//	@:native("") static public function slk_attr_off(const attrs:Attrs, void * opts):STATE;
//	@:native("") static public function slk_attr_set(const attrs:Attrs, color_pair:Short, void* opts):STATE;
//       slk_attr:Attrs();
//	@:native("") static public function slk_color(color_pair:Short):STATE;
//	@:native("") static public function slk_wset(int labnum, const wchar_t *label, int fmt):STATE;
//
//	/* curs_termcap(3X)*/
//	@:native("") static public function tgetent(char *bp, const char *name):STATE;
//	@:native("") static public function tgetflag(char *id):STATE;
//	@:native("") static public function tgetnum(char *id):STATE;
//       char *tgetstr(char *id, char **area);
//       char *tgoto(const char *cap, int col, int row);
//	@:native("") static public function tputs(const char *str, int affcnt, int (*putc)(int)):STATE;
//
//	/* wresize(3X)**/
//	@:native("") static public function wresize(WINDOW *win, int lines, int columns):STATE;

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
	@:native("A_STANDOUT") var A_STANDOUT;   //Best highlighting mode of the terminal.
	@:native("A_UNDERLINE") var A_UNDERLINE; //Underlining
	@:native("A_REVERSE") var A_REVERSE;     //Reverse video
	@:native("A_BLINK") var A_BLINK;         //Blinking
	@:native("A_DIM") var A_DIM;          	 //Half bright
	@:native("A_BOLD") var A_BOLD;         	 //Extra bright or bold
	@:native("A_PROTECT") var A_PROTECT;     //Protected mode
	@:native("A_INVIS") var A_INVIS;         //Invisible or blank mode
	@:native("A_ALTCHARSET") var A_ALTCHARSET;  //Alternate character set
	@:native("A_ITALIC") var A_ITALIC;       		//Italics (non-X/Open extension)
	@:native("A_CHARTEXT") var A_CHARTEXT;     	//Bit-mask to extract a character
}

@:enum extern abstract HIGHLIGHT(Int) to Int{
	@:native("WA_HORIZONTAL") var WA_HORIZONTAL;  //Horizontal highlight
	@:native("WA_LEFT") var WA_LEFT;   	 			    //Left highlight
	@:native("WA_LOW") var WA_LOW;         				//Low highlight
	@:native("WA_RIGHT") var WA_RIGHT;       			//Right highlight
	@:native("WA_TOP") var WA_TOP;        				//Top highlight
	@:native("WA_VERTICAL") var WA_VERTICAL;    	//Vertical highlight
}

@:enum extern abstract TRACE_PARAM(UInt32) to UInt32{
	@:native("TRACE_DISABLE") var TRACE_DISABLE;		/* turn off tracing. */
	@:native("TRACE_TIMES") var TRACE_TIMES;				/* trace user and system times of updates. */
	@:native("TRACE_TPUTS") var TRACE_TPUTS;				/* trace tputs calls. */
	@:native("TRACE_UPDATE") var TRACE_UPDATE;			/* trace update actions, old & new screens. */
	@:native("TRACE_MOVE") var TRACE_MOVE;					/* trace cursor movement and scrolling. */
	@:native("TRACE_CHARPUT") var TRACE_CHARPUT;		/* trace all character outputs. */
	@:native("TRACE_ORDINARY") var TRACE_ORDINARY;	/* trace all update actions.  The old and new screen contents are written to the trace file for each refresh. */
	@:native("TRACE_CALLS") var TRACE_CALLS;				/* trace all curses calls.  The parameters for each call are traced, as well as return values. */
	@:native("TRACE_VIRTPUT") var TRACE_VIRTPUT;		/* trace virtual character puts, i.e., calls to addch. */
	@:native("TRACE_IEVENT") var TRACE_IEVENT;			/* trace low-level input processing, including timeouts. */
	@:native("TRACE_BITS") var TRACE_BITS;					/* trace state of TTY control bits. */
	@:native("TRACE_ICALLS") var TRACE_ICALLS;			/* trace internal/nested calls. */
	@:native("TRACE_CCALLS") var TRACE_CCALLS;			/* trace per-character calls. */
	@:native("TRACE_DATABASE") var TRACE_DATABASE;	/* trace read/write of terminfo/termcap data. */
	@:native("TRACE_ATTRS") var TRACE_ATTRS;				/* trace changes to video attributes and colors. */
	@:native("TRACE_MAXIMUM") var TRACE_MAXIMUM;		/* maximum trace level, enables all of the separate trace features.		 */
}


@:native("MEVENT")
@:structAccess
@:final extern class MEVENT{
	var id:Short; /* ID to distinguish multiple devices */
	var x:Int;    /* event coordinates */
	var y:Int;    	
	var z:Int;
	// mmask_t bstate /* button state bits */
}

@:native("cchar_t")
@:final extern abstract CChar_t(UInt32){}

@:final @:enum extern abstract CCHar_t_Const(ConstPointer<CChar_t>) to ConstPointer<CChar_t>{
	@:native("WACS_S1") var WACS_S1; //   NCURSES_WACS('o') /* scan line 1 */
	@:native("WACS_S9") var WACS_S9; //   NCURSES_WACS('s') /* scan line 9 */
	@:native("WACS_DIAMOND") var WACS_DIAMOND; //  NCURSES_WACS('`') /* diamond */
	@:native("WACS_CKBOARD") var WACS_CKBOARD; //  NCURSES_WACS('a') /* checker board */
	@:native("WACS_DEGREE") var WACS_DEGREE; // NCURSES_WACS('f') /* degree symbol */
	@:native("WACS_PLMINUS") var WACS_PLMINUS; //  NCURSES_WACS('g') /* plus/minus */
	@:native("WACS_BULLET") var WACS_BULLET; // NCURSES_WACS('~') /* bullet */

	/* Teletype 5410v1 symbols */
	@:native("WACS_LARROW") var WACS_LARROW; // NCURSES_WACS(',') /* arrow left */
	@:native("WACS_RARROW") var WACS_RARROW; // NCURSES_WACS('+') /* arrow right */
	@:native("WACS_DARROW") var WACS_DARROW; // NCURSES_WACS('.') /* arrow down */
	@:native("WACS_UARROW") var WACS_UARROW; // NCURSES_WACS('-') /* arrow up */
	@:native("WACS_BOARD") var WACS_BOARD; //  NCURSES_WACS('h') /* board of squares */
	@:native("WACS_LANTERN") var WACS_LANTERN; //  NCURSES_WACS('i') /* lantern symbol */
	@:native("WACS_BLOCK") var WACS_BLOCK; //  NCURSES_WACS('0') /* solid square block */

	/* ncurses extensions */
	@:native("WACS_S3") var WACS_S3; //   NCURSES_WACS('p') /* scan line 3 */
	@:native("WACS_S7") var WACS_S7; //   NCURSES_WACS('r') /* scan line 7 */
	@:native("WACS_LEQUAL") var WACS_LEQUAL; // NCURSES_WACS('y') /* less/equal */
	@:native("WACS_GEQUAL") var WACS_GEQUAL; // NCURSES_WACS('z') /* greater/equal */
	@:native("WACS_PI") var WACS_PI; //   NCURSES_WACS('{') /* Pi */
	@:native("WACS_NEQUAL") var WACS_NEQUAL; // NCURSES_WACS('|') /* not equal */
	@:native("WACS_STERLING") var WACS_STERLING; // NCURSES_WACS('}') /* UK pound sign */

	/* double lines */
	@:native("WACS_BDDB") var WACS_BDDB; // NCURSES_WACS('C')
	@:native("WACS_DDBB") var WACS_DDBB; // NCURSES_WACS('D')
	@:native("WACS_BBDD") var WACS_BBDD; // NCURSES_WACS('B')
	@:native("WACS_DBBD") var WACS_DBBD; // NCURSES_WACS('A')
	@:native("WACS_DBDD") var WACS_DBDD; // NCURSES_WACS('G')
	@:native("WACS_DDDB") var WACS_DDDB; // NCURSES_WACS('F')
	@:native("WACS_DDBD") var WACS_DDBD; // NCURSES_WACS('H')
	@:native("WACS_BDDD") var WACS_BDDD; // NCURSES_WACS('I')
	@:native("WACS_BDBD") var WACS_BDBD; // NCURSES_WACS('R')
	@:native("WACS_DBDB") var WACS_DBDB; // NCURSES_WACS('Y')
	@:native("WACS_DDDD") var WACS_DDDD; // NCURSES_WACS('E')

	@:native("WACS_D_ULCORNER") var WACS_D_ULCORNER; // WACS_BDDB
	@:native("WACS_D_LLCORNER") var WACS_D_LLCORNER; // WACS_DDBB
	@:native("WACS_D_URCORNER") var WACS_D_URCORNER; // WACS_BBDD
	@:native("WACS_D_LRCORNER") var WACS_D_LRCORNER; // WACS_DBBD
	@:native("WACS_D_RTEE") var WACS_D_RTEE; // WACS_DBDD
	@:native("WACS_D_LTEE") var WACS_D_LTEE; // WACS_DDDB
	@:native("WACS_D_BTEE") var WACS_D_BTEE; // WACS_DDBD
	@:native("WACS_D_TTEE") var WACS_D_TTEE; // WACS_BDDD
	@:native("WACS_D_HLINE") var WACS_D_HLINE; //  WACS_BDBD
	@:native("WACS_D_VLINE") var WACS_D_VLINE; //  WACS_DBDB
	@:native("WACS_D_PLUS") var WACS_D_PLUS; // WACS_DDDD

	/* thick lines */
	@:native("WACS_BTTB") var WACS_BTTB; // NCURSES_WACS('L')
	@:native("WACS_TTBB") var WACS_TTBB; // NCURSES_WACS('M')
	@:native("WACS_BBTT") var WACS_BBTT; // NCURSES_WACS('K')
	@:native("WACS_TBBT") var WACS_TBBT; // NCURSES_WACS('J')
	@:native("WACS_TBTT") var WACS_TBTT; // NCURSES_WACS('U')
	@:native("WACS_TTTB") var WACS_TTTB; // NCURSES_WACS('T')
	@:native("WACS_TTBT") var WACS_TTBT; // NCURSES_WACS('V')
	@:native("WACS_BTTT") var WACS_BTTT; // NCURSES_WACS('W')
	@:native("WACS_BTBT") var WACS_BTBT; // NCURSES_WACS('Q')
	@:native("WACS_TBTB") var WACS_TBTB; // NCURSES_WACS('X')
	@:native("WACS_TTTT") var WACS_TTTT; // NCURSES_WACS('N')
}
