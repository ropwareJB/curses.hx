package curses.cpp;

import cpp.Char;
import cpp.Pointer;
import cpp.ConstPointer;
import cpp.UInt32;
import cpp.UInt64;
import cpp.Int32 as Short;
import haxe.extern.Rest; 

typedef Attrs = Int; 			// attr_t
typedef Null = Pointer<cpp.Void>; // void*, but should always be 0.
typedef WInt = UInt32;
typedef MMask_t = UInt64; // mmask_t;
//@:native("cchar_t") typedef CChar_t = Int; 		// cchar_t

@:enum abstract CONSTS(Null) to Null{ var Nothing = null; }

@:include("curses.h") 
@:buildXml("
<target id=\"haxe\">
	<lib name='-lncurses'/>
</target>
")
@:final extern class Curses{

	@:native("COLOR_PAIR") static public function color_pair(n:Int):CHType;

	//@:native("initscr") static public function initscr():Pointer<Window>;
	//@:native("mvaddstr") static public function mvaddstr(y:Int,x:Int,str:String):Void;
	//@:native("refresh") static public function refresh():Void;
	//@:native("delwin") static public function delwin(w:Pointer<Window>):Void;
	//@:native("endwin") static public function endwin():Void;

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
	@:native("_tracef") static public function _tracef(format:String, vs:Rest<Dynamic>):Void;
	@:native("_tracedump") static public function _tracedump(label:String, win:Pointer<Window>):Void;
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

	/* curs_addch(3X)*/
	@:native("addch") static public function addch(ch:CHType):STATE;
	@:native("waddch") static public function waddch(win:Pointer<Window>, ch:CHType):STATE;
	@:native("mvaddch") static public function mvaddch(y:Int, x:Int, ch:CHType):STATE;
	@:native("mvwaddch") static public function mvwaddch(win:Pointer<Window>, y:Int, x:Int, ch:CHType):STATE;
	@:native("echochar") static public function echochar(ch:CHType):STATE;
	@:native("wechochar") static public function wechochar(win:Pointer<Window>, ch:CHType):STATE;

	/* curs_addchstr(3X)*/
	@:native("addchstr") static public function addchstr(chstr:ConstPointer<CHType>):STATE;
	@:native("addchnstr") static public function addchnstr(chstr:ConstPointer<CHType>, n:Int):STATE;
	@:native("waddchstr") static public function waddchstr(win:Pointer<Window>, chstr:ConstPointer<CHType>):STATE;
	@:native("waddchnstr") static public function waddchnstr(win:Pointer<Window>, chstr:ConstPointer<CHType>, n:Int):STATE;
	@:native("mvaddchstr") static public function mvaddchstr(y:Int, x:Int, chstr:ConstPointer<CHType>):STATE;
	@:native("mvaddchnstr") static public function mvaddchnstr(y:Int, x:Int, chstr:ConstPointer<CHType>, n:Int):STATE;
	@:native("mvwaddchstr") static public function mvwaddchstr(win:Pointer<Window>, y:Int, x:Int, chstr:ConstPointer<CHType>):STATE;
	@:native("mvwaddchnstr") static public function mvwaddchnstr(win:Pointer<Window>, y:Int, x:Int, chstr:ConstPointer<CHType>, n:Int):STATE;

	/* curs_addstr(3X)*/
	@:native("addstr") static public function addstr(str:String):STATE;
	@:native("addnstr") static public function addnstr(str:String, n:Int):STATE;
	@:native("waddstr") static public function waddstr(win:Pointer<Window>, str:String):STATE;
	@:native("waddnstr") static public function waddnstr(win:Pointer<Window>, str:String, n:Int):STATE;
	@:native("mvaddstr") static public function mvaddstr(y:Int, x:Int, str:String):STATE;
	@:native("mvaddnstr") static public function mvaddnstr(y:Int, x:Int, str:String, n:Int):STATE;
	@:native("mvwaddstr") static public function mvwaddstr(win:Pointer<Window>, y:Int, x:Int, str:String):STATE;
	@:native("mvwaddnstr") static public function mvwaddnstr(win:Pointer<Window>, y:Int, x:Int, str:String, n:Int):STATE;

	 /* curs_addwstr(3X)*/
	@:native("addwstr") static public function addwstr(wstr:ConstPointer<WChar_t>):STATE;
	@:native("addnwstr") static public function addnwstr(wstr:ConstPointer<WChar_t>, n:Int):STATE;
	@:native("waddwstr") static public function waddwstr(win:Pointer<Window>, wstr:ConstPointer<WChar_t>):STATE;
	@:native("waddnwstr") static public function waddnwstr(win:Pointer<Window>, wstr:ConstPointer<WChar_t>, n:Int):STATE;
	@:native("mvaddwstr") static public function mvaddwstr(y:Int, x:Int, wstr:ConstPointer<WChar_t>):STATE;
	@:native("mvaddnwstr") static public function mvaddnwstr(y:Int, x:Int, wstr:ConstPointer<WChar_t>, n:Int):STATE;
	@:native("mvwaddwstr") static public function mvwaddwstr(win:Pointer<Window>, y:Int, x:Int, wstr:ConstPointer<WChar_t>):STATE;
	@:native("mvwaddnwstr") static public function mvwaddnwstr(win:Pointer<Window>, y:Int, x:Int, wstr:ConstPointer<WChar_t>, n:Int):STATE;

	/* default_colors(3X)**/
	@:native("use_default_colors") static public function use_default_colors():STATE;
	@:native("assume_default_colors") static public function assume_default_colors(f:Int, bg:Int):STATE;

	/* curs_termattrs(3X)*/
	@:native("baudrate") static public function baudrate():STATE;
	@:native("erasechar") static public function erasechar():Char;
	@:native("erasewchar") static public function erasewchar(ch:Pointer<WChar_t>):STATE;
	@:native("has_ic") static public function has_ic():Bool;
	@:native("has_il") static public function has_il():Bool;
	@:native("killchar") static public function killchar():Char;
	@:native("killwchar") static public function killwchar(ch:Pointer<WChar_t>):STATE;
	@:native("longname") static public function longname():String;
	@:native("term_attrs") static public function term_attrs():Attrs;
	@:native("termattrs") static public function termattrs():CHType;
	@:native("termname") static public function termname():String;

	/* curs_beep(3X)*/
	@:native("beep") static public function beep():STATE;
	@:native("flash") static public function flash():STATE;

	/* curs_bkgd(3X)*/
  @:native("bkgdset") static public function bkgdset(ch:CHType):Void;
  @:native("wbkgdset") static public function wbkgdset(win:Pointer<Window>, ch:CHType):Void;
	@:native("bkgd") static public function bkgd(ch:CHType):STATE;
	@:native("wbkgd") static public function wbkgd(win:Pointer<Window>, ch:CHType):STATE;
  @:native("getbkgd") static public function getbkgd(win:Pointer<Window>):CHType;

	/* curs_bkgrnd(3X)*/
	@:native("bkgrnd") static public function bkgrnd(wch:ConstPointer<CChar_t>):STATE;
	@:native("wbkgrnd") static public function wbkgrnd(win:Pointer<Window>, wch:ConstPointer<CChar_t>):STATE;
  @:native("bkgrndset") static public function bkgrndset(wch:ConstPointer<CChar_t>):Void;
  @:native("wbkgrndset") static public function wbkgrndset(win:Pointer<Window>, wch:ConstPointer<CChar_t>):Void;
	@:native("getbkgrnd") static public function getbkgrnd(wch:Pointer<CChar_t>):STATE;
	@:native("wgetbkgrnd") static public function wgetbkgrnd(win:Pointer<Window>, wch:Pointer<CChar_t>):STATE;

 /* curs_border(3X)*/
	@:native("border") static public function border(ls:CHType, rs:CHType, ts:CHType, bs:CHType, tl:CHType, tr:CHType, bl:CHType, br:CHType):STATE;
	@:native("wborder") static public function wborder(win:Pointer<Window>, ls:CHType, rs:CHType, ts:CHType, bs:CHType, tl:CHType, tr:CHType, bl:CHType, br:CHType):STATE;
	@:native("box") static public function box(win:Pointer<Window>, verch:CHType, horch:CHType):STATE;
	@:native("hline") static public function hline(ch:CHType, n:Int):STATE;
	@:native("whline") static public function whline(win:Pointer<Window>, ch:CHType, n:Int):STATE;
	@:native("vline") static public function vline(ch:CHType, n:Int):STATE;
	@:native("wvline") static public function wvline(win:Pointer<Window>, ch:CHType, n:Int):STATE;
	@:native("mvhline") static public function mvhline(y:Int, x:Int, ch:CHType, n:Int):STATE;
	@:native("mvwhline") static public function mvwhline(win:Pointer<Window>, y:Int, x:Int, ch:CHType, n:Int):STATE;
	@:native("mvvline") static public function mvvline(y:Int, x:Int, ch:CHType, n:Int):STATE;
	@:native("mvwvline") static public function mvwvline(win:Pointer<Window>, y:Int, x:Int, ch:CHType, n:Int):STATE;

	/* curs_border_set(3X)*/
	@:native("border_set") static public function border_set(
			  ls:ConstPointer<CChar_t>, rs:ConstPointer<CChar_t>,
			  ts:ConstPointer<CChar_t>, bs:ConstPointer<CChar_t>,
			  tl:ConstPointer<CChar_t>, tr:ConstPointer<CChar_t>,
			  bl:ConstPointer<CChar_t>, br:ConstPointer<CChar_t> ):STATE;
	@:native("wborder_set") static public function wborder_set(
				win:Pointer<Window>,
				ls:ConstPointer<CChar_t>, rs:ConstPointer<CChar_t>,
				ts:ConstPointer<CChar_t>, bs:ConstPointer<CChar_t>,
				tl:ConstPointer<CChar_t>, tr:ConstPointer<CChar_t>, 
				bl:ConstPointer<CChar_t>, br:ConstPointer<CChar_t>):STATE;
	@:native("box_set") static public function box_set(win:Pointer<Window>, verch:ConstPointer<CChar_t>, horch:ConstPointer<CChar_t>):STATE;
	@:native("hline_set") static public function hline_set(wch:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("whline_set") static public function whline_set(win:Pointer<Window>, wch:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("mvhline_set") static public function mvhline_set(y:Int, x:Int, wch:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("mvwhline_set") static public function mvwhline_set(win:Pointer<Window>, y:Int, x:Int, wch:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("vline_set") static public function vline_set(wch:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("wvline_set") static public function wvline_set(win:Pointer<Window>, wch:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("mvvline_set") static public function mvvline_set(y:Int, x:Int, wch:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("mvwvline_set") static public function mvwvline_set(win:Pointer<Window>, y:Int, x:Int, wch:ConstPointer<CChar_t>, n:Int):STATE;

	/* curs_inopts(3X)*/
	@:native("cbreak") static public function cbreak():STATE;
	@:native("nocbreak") static public function nocbreak():STATE;
	@:native("echo") static public function echo():STATE;
	@:native("noecho") static public function noecho():STATE;
	@:native("halfdelay") static public function halfdelay(tenths:Int):STATE;
	@:native("intrflush") static public function intrflush(win:Pointer<Window>, bf:Bool):STATE;
	@:native("keypad") static public function keypad(win:Pointer<Window>, bf:Bool):STATE;
	@:native("meta") static public function meta(win:Pointer<Window>, bf:Bool):STATE;
	@:native("nodelay") static public function nodelay(win:Pointer<Window>, bf:Bool):STATE;
	@:native("raw") static public function raw():STATE;
	@:native("noraw") static public function noraw():STATE;
	@:native("noqiflush") static public function noqiflush():Void;
	@:native("qiflush") static public function qiflush():Void;
	@:native("notimeout") static public function notimeout(win:Pointer<Window>, bf:Bool):STATE;
	@:native("timeout") static public function timeout(delay:Int):Void;
	@:native("wtimeout") static public function wtimeout(win:Pointer<Window>, delay:Int):Void;
	@:native("typeahead") static public function typeahead(fd:Int):STATE;

	/* curs_clear(3X)*/
	@:native("erase") static public function erase():STATE;
	@:native("werase") static public function werase(win:Pointer<Window>):STATE;
	@:native("clear") static public function clear():STATE;
	@:native("wclear") static public function wclear(win:Pointer<Window>):STATE;
	@:native("clrtobot") static public function clrtobot():STATE;
	@:native("wclrtobot") static public function wclrtobot(win:Pointer<Window>):STATE;
	@:native("clrtoeol") static public function clrtoeol():STATE;
	@:native("wclrtoeol") static public function wclrtoeol(win:Pointer<Window>):STATE;

	/* curs_outopts(3X)*/
	@:native("clearok") static public function clearok(win:Pointer<Window>, bf:Bool):STATE;
	@:native("idlok") static public function idlok(win:Pointer<Window>, bf:Bool):STATE;
  @:native("idcok") static public function idcok(win:Pointer<Window>, bf:Bool):Void;
  @:native("immedok") static public function immedok(win:Pointer<Window>, bf:Bool):Void;
	@:native("leaveok") static public function leaveok(win:Pointer<Window>, bf:Bool):STATE;
	@:native("setscrreg") static public function setscrreg(top:Int, bot:Int):STATE;
	@:native("wsetscrreg") static public function wsetscrreg(win:Pointer<Window>, top:Int, bot:Int):STATE;
	@:native("scrollok") static public function scrollok(win:Pointer<Window>, bf:Bool):STATE;
	@:native("nl") static public function nl():STATE;
	@:native("nonl") static public function nonl():STATE;

	/* curs_overlay(3X)*/
	@:native("overlay") static public function overlay(srcwin:Pointer<Window>, dstwin:Pointer<Window>):STATE;
	@:native("overwrite") static public function overwrite(srcwin:Pointer<Window>, dstwin:Pointer<Window>):STATE;
	@:native("copywin") static public function copywin(srcwin:Pointer<Window>, dstwin:Pointer<Window>, sminrow:Int,
             smincol:Int, dminrow:Int, dmincol:Int, dmaxrow:Int,
             dmaxcol:Int, overlay:Int):STATE;

	/* curs_kernel(3X)*/
	@:native("def_prog_mode") static public function def_prog_mode():STATE;
	@:native("def_shell_mode") static public function def_shell_mode():STATE;
	@:native("reset_prog_mode") static public function reset_prog_mode():STATE;
	@:native("reset_shell_mode") static public function reset_shell_mode():STATE;
	@:native("resetty") static public function resetty():STATE;
	@:native("savetty") static public function savetty():STATE;
  @:native("getsyx") static public function getsyx(y:Int, x:Int):Void;
  @:native("setsyx") static public function setsyx(y:Int, x:Int):Void;
	//@:native("ripoffline") static public function ripoffline(line:Int, int (*init)(WINDOW *, int:Pointer<Window>)):STATE;
	@:native("curs_set") static public function curs_set(visibility:Int):STATE;
	@:native("napms") static public function napms(ms:Int):STATE;

 /* curs_extend(3X)**/
 @:native("curses_version") static public function curses_version():String;
 @:native("use_extended_names") static public function use_extended_names(enable:Bool):STATE;

 /* define_key(3X)**/
	@:native("define_key") static public function define_key(definition:String, keycode:Int):STATE;

 /* curs_terminfo(3X)*/
	@:native("setupterm") static public function setupterm(term:String, fildes:Int, errret:Pointer<Int>):STATE;
	@:native("setterm") static public function setterm(term:String):STATE;
  @:native("set_curterm") static public function set_curterm(nterm:Pointer<Terminal>):Pointer<Terminal>;
	@:native("del_curterm") static public function del_curterm(oterm:Pointer<Terminal>):STATE;
	@:native("restartterm") static public function restartterm(term:String, fildes:Int, errret:Pointer<Int>):STATE;
	//@:native("tparm") static public function tparm(str:String, ...):String;
	//@:native("tputs") static public function tputs(const str:String, affcnt:Int, int (*putc)(int)):STATE;
	@:native("putp") static public function putp(str:String):STATE;
	//@:native("vidputs") static public function vidputs(attrs:CHType, int (*putc)(int)):STATE;
	@:native("vidattr") static public function vidattr(attrs:CHType):STATE;
	//@:native("vid_puts") static public function vid_puts(attrs:Attrs, pair:Short, opts:Null, int (*putc)(int)):STATE;
	@:native("vid_attr") static public function vid_attr(attrs:Attrs, pair:Short, opts:Null):STATE;
	@:native("mvcur") static public function mvcur(oldrow:Int, oldcol:Int, newrow:Int, newcol:Int):STATE;
	@:native("tigetflag") static public function tigetflag(capname:String):STATE;
	@:native("tigetnum") static public function tigetnum(capname:String):STATE;
  @:native("tigetstr") static public function tigetstr(capname:String):String;
  //@:native("tiparm") static public function tiparm(const char *str:String, ...):String;

	/* curs_util(3X)*/
  @:native("unctrl") static public function unctrl(c:CHType):String;
  @:native("wunctrl") static public function wunctrl(c:Pointer<CChar_t>):WChar_t;
  @:native("keyname") static public function keyname(c:Int):String;
  @:native("key_name") static public function key_name(w:WChar_t):String;
  @:native("filter") static public function filter():Void;
  @:native("nofilter") static public function nofilter():Void;
  @:native("use_env") static public function use_env(f:Bool):Void;
  @:native("use_tioctl") static public function use_tioctl(f:Bool):Void;
	//@:native("putwin") static public function putwin(win:Pointer<Window>, FILE *filep):STATE;
  //@:native("getwin") static public function getwin(FILE *filep):Pointer<Window>;
	@:native("delay_output") static public function delay_output(ms:Int):STATE;
  @:native("flushinp") static public function flushinp():Int;

	/* curs_delch(3X)*/
	@:native("delch") static public function delch():STATE;
	@:native("wdelch") static public function wdelch(win:Pointer<Window>):STATE;
	@:native("mvdelch") static public function mvdelch(y:Int, x:Int):STATE;
	@:native("mvwdelch") static public function mvwdelch(win:Pointer<Window>, y:Int, x:Int):STATE;

	/* curs_deleteln(3X)*/
	@:native("deleteln") static public function deleteln():STATE;
	@:native("wdeleteln") static public function wdeleteln(win:Pointer<Window>):STATE;
	@:native("insdelln") static public function insdelln(n:Int):STATE;
	@:native("winsdelln") static public function winsdelln(win:Pointer<Window>, n:Int):STATE;
	@:native("insertln") static public function insertln():STATE;
	@:native("winsertln") static public function winsertln(win:Pointer<Window>):STATE;

	/* curs_initscr(3X)*/
  @:native("initscr") static public function initscr():Pointer<Window>;
	@:native("endwin") static public function endwin():STATE;
  @:native("isendwin") static public function isendwin():Bool;
  //@:native("newterm") static public function newterm(type:String, FILE *outfd, FILE *infd):Pointer<Screen>;
  @:native("set_term") static public function set_term(n:Pointer<Screen>):Pointer<Screen>;
  @:native("delscreen") static public function delscreen(sp:Pointer<Screen>):Void;

 /* curs_window(3X)*/
	@:native("newwin") static public function newwin(
             nlines:Int, ncols:Int,
             begin_y:Int, begin_x:Int):Pointer<Window>;
	@:native("delwin") static public function delwin(win:Pointer<Window>):STATE;
	@:native("mvwin") static public function mvwin(win:Pointer<Window>, y:Int, x:Int):STATE;
	@:native("subwin") static public function subwin(orig:Pointer<Window>,
             nlines:Int, ncols:Int,
             begin_y:Int, begin_x:Int):Pointer<Window>;
	@:native("derwin") static public function derwin(orig:Pointer<Window>,
             nlines:Int, ncols:Int,
             begin_y:Int, begin_x:Int):Pointer<Window>;
	@:native("mvderwin") static public function mvderwin(win:Pointer<Window>, par_y:Int, par_x:Int):STATE;
  @:native("dupwin") static public function dupwin(win:Pointer<Window>):Pointer<Window>;
  @:native("wsyncup") static public function wsyncup(win:Pointer<Window>):Void;
	@:native("syncok") static public function syncok(win:Pointer<Window>, bf:Bool):STATE;
  @:native("wcursyncup") static public function wcursyncup(win:Pointer<Window>):Void;
  @:native("wsyncdown") static public function wsyncdown(win:Pointer<Window>):Void;

	/* curs_refresh(3X)*/
	@:native("refresh") static public function refresh():STATE;
	@:native("wrefresh") static public function wrefresh(win:Pointer<Window>):STATE;
	@:native("wnoutrefresh") static public function wnoutrefresh(win:Pointer<Window>):STATE;
	@:native("doupdate") static public function doupdate():STATE;
	@:native("redrawwin") static public function redrawwin(win:Pointer<Window>):STATE;
	@:native("wredrawln") static public function wredrawln(win:Pointer<Window>, beg_line:Int, num_lines:Int):STATE;

	/* curs_get_wch(3X)*/
	@:native("get_wch") static public function get_wch(wch:WInt):Int;
	@:native("wget_wch") static public function wget_wch(win:Pointer<Window>, wch:WInt):Int;
	@:native("mvget_wch") static public function mvget_wch(y:Int, x:Int, wch:WInt):Int;
	@:native("mvwget_wch") static public function mvwget_wch(win:Pointer<Window>, y:Int, x:Int, wch:WInt):Int;
	@:native("unget_wch") static public function unget_wch(wch:WChar_t):Int;

	/* curs_get_wstr(3X)*/
	@:native("get_wstr") static public function get_wstr(wstr:WInt):STATE;
	@:native("getn_wstr") static public function getn_wstr(wstr:WInt, n:Int):STATE;
	@:native("wget_wstr") static public function wget_wstr(win:Pointer<Window>, wstr:WInt):STATE;
	@:native("wgetn_wstr") static public function wgetn_wstr(win:Pointer<Window>, wstr:WInt, n:Int):STATE;
	@:native("mvget_wstr") static public function mvget_wstr(y:Int, x:Int, wstr:WInt):STATE;
	@:native("mvgetn_wstr") static public function mvgetn_wstr(y:Int, x:Int, wstr:WInt, n:Int):STATE;
	@:native("mvwget_wstr") static public function mvwget_wstr(win:Pointer<Window>, y:Int, x:Int, wstr:WInt):STATE;
	@:native("mvwgetn_wstr") static public function mvwgetn_wstr(win:Pointer<Window>, y:Int, x:Int, wstr:WInt, n:Int):STATE;

	/* curs_getyx(3X)*/
	@:native("getyx") static public function getyx(win:Pointer<Window>, y:Int, x:Int):Void;
	@:native("getparyx") static public function getparyx(win:Pointer<Window>, y:Int, x:Int):Void;
	@:native("getbegyx") static public function getbegyx(win:Pointer<Window>, y:Int, x:Int):Void;
	@:native("getmaxyx") static public function getmaxyx(win:Pointer<Window>, y:Int, x:Int):Void;

/* curs_getcchar(3X)*/
	@:native("getcchar") static public function getcchar(
					 wcval:ConstPointer<CChar_t>,
					 wch:Pointer<WChar_t>,
					 attrs:Pointer<Attrs>,
					 color_pair:Pointer<Short>,
					 opts:Null ):Int;
	@:native("setcchar") static public function setcchar(
					 wcval:Pointer<CChar_t>,
					 wch:ConstPointer<WChar_t>,
					 attrs:Attrs,
					 color_pair:Short,
					 opts:Null ):Int;


	/* curs_getch(3X)*/
  @:native("getch") static public function getch():Int;
  @:native("wgetch") static public function wgetch(win:Pointer<Window>):Int;
  @:native("mvgetch") static public function mvgetch(y:Int, x:Int):Int;
  @:native("mvwgetch") static public function mvwgetch(win:Pointer<Window>, y:Int, x:Int):Int;
  @:native("ungetch") static public function ungetch(ch:Int):Int;
  @:native("has_key") static public function has_key(ch:Int):Int;

	/* curs_mouse(3X)**/
	@:native("has_mouse") static public function has_mouse():Bool;
	@:native("getmouse") static public function getmouse(event:Pointer<MEVENT>):STATE;
	@:native("ungetmouse") static public function ungetmouse(event:Pointer<MEVENT>):STATE;
	@:native("mousemask") static public function mousemask(newmask:MMask_t, oldmask:Pointer<MMask_t>):MMask_t;
	@:native("wenclose") static public function wenclose(win:Pointer<Window>, y:Int, x:Int):Bool;
	@:native("mouse_trafo") static public function mouse_trafo(pY:Pointer<Int>, pX:Pointer<Int>, to_screen:Bool):Bool;
	@:native("wmouse_trafo") static public function wmouse_trafo(win:Pointer<Window>, pY:Pointer<Int>, pX:Pointer<Int>,
					to_screen:Bool):Bool;
	@:native("mouseinterval") static public function mouseinterval(erval:Int):Int;


	/* curs_getstr(3X)*/
	@:native("getstr") static public function getstr(str:String):STATE;
	@:native("getnstr") static public function getnstr(str:String, n:Int):STATE;
	@:native("wgetstr") static public function wgetstr(win:Pointer<Window>, str:String):STATE;
	@:native("wgetnstr") static public function wgetnstr(win:Pointer<Window>, str:String, n:Int):STATE;
	@:native("mvgetstr") static public function mvgetstr(y:Int, x:Int, str:String):STATE;
	@:native("mvwgetstr") static public function mvwgetstr(win:Pointer<Window>, y:Int, x:Int, str:String):STATE;
	@:native("mvgetnstr") static public function mvgetnstr(y:Int, x:Int, str:String, n:Int):STATE;
	@:native("mvwgetnstr") static public function mvwgetnstr(win:Pointer<Window>, y:Int, x:Int, str:String, n:Int):STATE;

	/* curs_in_wch(3X)*/
	@:native("in_wch") static public function in_wch(wcval:Pointer<CChar_t>):STATE;
	@:native("mvin_wch") static public function mvin_wch(y:Int, x:Int, wcval:Pointer<CChar_t>):STATE;
	@:native("mvwin_wch") static public function mvwin_wch(win:Pointer<Window>, y:Int, x:Int, wcval:Pointer<CChar_t>):STATE;
	@:native("win_wch") static public function win_wch(win:Pointer<Window>, wcval:Pointer<CChar_t>):STATE;

	/* curs_in_wchstr(3X)*/
	@:native("in_wchstr") static public function in_wchstr(wchstr:Pointer<CChar_t>):STATE;
	@:native("in_wchnstr") static public function in_wchnstr(wchstr:Pointer<CChar_t>, n:Int):STATE;
	@:native("win_wchstr") static public function win_wchstr(win:Pointer<Window>, wchstr:Pointer<CChar_t>):STATE;
	@:native("win_wchnstr") static public function win_wchnstr(win:Pointer<Window>, wchstr:Pointer<CChar_t>, n:Int):STATE;
	@:native("mvin_wchstr") static public function mvin_wchstr(y:Int, x:Int, wchstr:Pointer<CChar_t>):STATE;
	@:native("mvin_wchnstr") static public function mvin_wchnstr(y:Int, x:Int, wchstr:Pointer<CChar_t>, n:Int):STATE;
	@:native("mvwin_wchstr") static public function mvwin_wchstr(win:Pointer<Window>, y:Int, x:Int, wchstr:Pointer<CChar_t>):STATE;
	@:native("mvwin_wchnstr") static public function mvwin_wchnstr(win:Pointer<Window>, y:Int, x:Int, wchstr:Pointer<CChar_t>, n:Int):STATE;

	/* curs_inch(3X)*/
  @:native("inch") static public function inch():CHType;
  @:native("winch") static public function winch(win:Pointer<Window>):CHType;
  @:native("mvinch") static public function mvinch(y:Int, x:Int):CHType;
  @:native("mvwinch") static public function mvwinch(win:Pointer<Window>, y:Int, x:Int):CHType;

	/* curs_inchstr(3X)*/
	@:native("inchstr") static public function inchstr(chstr:Pointer<CHType>):Int;
	@:native("inchnstr") static public function inchnstr(chstr:Pointer<CHType>, n:Int):Int;
	@:native("winchstr") static public function winchstr(win:Pointer<Window>, chstr:Pointer<CHType>):Int;
	@:native("winchnstr") static public function winchnstr(win:Pointer<Window>, chstr:Pointer<CHType>, n:Int):Int;
	@:native("mvinchstr") static public function mvinchstr(y:Int, x:Int, chstr:Pointer<CHType>):Int;
	@:native("mvinchnstr") static public function mvinchnstr(y:Int, x:Int, chstr:Pointer<CHType>, n:Int):Int;
	@:native("mvwinchstr") static public function mvwinchstr(win:Pointer<Window>, y:Int, x:Int, chstr:Pointer<CHType>):Int;
	@:native("mvwinchnstr") static public function mvwinchnstr(win:Pointer<Window>, y:Int, x:Int, chstr:Pointer<CHType>, n:Int):Int;

	/* curs_instr(3X)*/
	@:native("instr") static public function instr(str:String):Int;
	@:native("innstr") static public function innstr(str:String, n:Int):Int;
	@:native("winstr") static public function winstr(win:Pointer<Window>, str:String):Int;
	@:native("winnstr") static public function winnstr(win:Pointer<Window>, str:String, n:Int):Int;
	@:native("mvinstr") static public function mvinstr(y:Int, x:Int, str:String):Int;
	@:native("mvinnstr") static public function mvinnstr(y:Int, x:Int, str:String, n:Int):Int;
	@:native("mvwinstr") static public function mvwinstr(win:Pointer<Window>, y:Int, x:Int, str:String):Int;
	@:native("mvwinnstr") static public function mvwinnstr(win:Pointer<Window>, y:Int, x:Int, str:String, n:Int):Int;

	/* curs_inwstr(3X)*/
	@:native("inwstr") static public function inwstr(str:Pointer<WChar_t>):Int;
	@:native("innwstr") static public function innwstr(str:Pointer<WChar_t>, n:Int):Int;
	@:native("winwstr") static public function winwstr(win:Pointer<Window>, str:Pointer<WChar_t>):Int;
	@:native("winnwstr") static public function winnwstr(win:Pointer<Window>, str:Pointer<WChar_t>, n:Int):Int;
	@:native("mvinwstr") static public function mvinwstr(y:Int, x:Int, str:Pointer<WChar_t>):Int;
	@:native("mvinnwstr") static public function mvinnwstr(y:Int, x:Int, str:Pointer<WChar_t>, n:Int):Int;
	@:native("mvwinwstr") static public function mvwinwstr(win:Pointer<Window>, y:Int, x:Int, str:Pointer<WChar_t>):Int;
	@:native("mvwinnwstr") static public function mvwinnwstr(win:Pointer<Window>, y:Int, x:Int, str:Pointer<WChar_t>, n:Int):Int;

	/* curs_ins_wstr(3X)*/
	@:native("ins_wstr") static public function ins_wstr(wstr:ConstPointer<WChar_t>):STATE;
	@:native("ins_nwstr") static public function ins_nwstr(wstr:ConstPointer<WChar_t>, n:Int):STATE;
	@:native("wins_wstr") static public function wins_wstr(win:Pointer<Window>, wstr:ConstPointer<WChar_t>):STATE;
	@:native("wins_nwstr") static public function wins_nwstr(win:Pointer<Window>, wstr:ConstPointer<WChar_t>, n:Int):STATE;
	@:native("mvins_wstr") static public function mvins_wstr(y:Int, x:Int, wstr:ConstPointer<WChar_t>):STATE;
	@:native("mvins_nwstr") static public function mvins_nwstr(y:Int, x:Int, wstr:ConstPointer<WChar_t>, n:Int):STATE;
	@:native("mvwins_wstr") static public function mvwins_wstr(win:Pointer<Window>, y:Int, x:Int, wstr:ConstPointer<WChar_t>):STATE;
	@:native("mvwins_nwstr") static public function mvwins_nwstr(win:Pointer<Window>, y:Int, x:Int, wstr:ConstPointer<WChar_t>, n:Int):STATE;

	/* curs_ins_wch(3X)*/
	@:native("ins_wch") static public function ins_wch(wch:ConstPointer<CChar_t>):STATE;
	@:native("wins_wch") static public function wins_wch(win:Pointer<Window>, wch:ConstPointer<CChar_t>):STATE;
	@:native("mvins_wch") static public function mvins_wch(y:Int, x:Int, wch:ConstPointer<CChar_t>):STATE;
	@:native("mvwins_wch") static public function mvwins_wch(win:Pointer<Window>, y:Int, x:Int, wch:ConstPointer<CChar_t>):STATE;

	/* curs_insch(3X)*/
	@:native("insch") static public function insch(ch:CHType):STATE;
	@:native("winsch") static public function winsch(win:Pointer<Window>, ch:CHType):STATE;
	@:native("mvinsch") static public function mvinsch(y:Int, x:Int, ch:CHType):STATE;
	@:native("mvwinsch") static public function mvwinsch(win:Pointer<Window>, y:Int, x:Int, ch:CHType):STATE;

	/* curs_insstr(3X)*/
	@:native("insstr") static public function insstr(str:String):STATE;
	@:native("insnstr") static public function insnstr(str:String, n:Int):STATE;
	@:native("winsstr") static public function winsstr(win:Pointer<Window>, str:String):STATE;
	@:native("winsnstr") static public function winsnstr(win:Pointer<Window>, str:String, n:Int):STATE;
	@:native("mvinsstr") static public function mvinsstr(y:Int, x:Int, str:String):STATE;
	@:native("mvinsnstr") static public function mvinsnstr(y:Int, x:Int, str:String, n:Int):STATE;
	@:native("mvwinsstr") static public function mvwinsstr(win:Pointer<Window>, y:Int, x:Int, str:String):STATE;
	@:native("mvwinsnstr") static public function mvwinsnstr(win:Pointer<Window>, y:Int, x:Int, str:String, n:Int):STATE;

	/* curs_opaque(3X)**/
  @:native("is_cleared") static public function is_cleared(win:Pointer<Window>):Bool;
  @:native("is_idcok") static public function is_idcok(win:Pointer<Window>):Bool;
  @:native("is_idlok") static public function is_idlok(win:Pointer<Window>):Bool;
  @:native("is_immedok") static public function is_immedok(win:Pointer<Window>):Bool;
  @:native("is_keypad") static public function is_keypad(win:Pointer<Window>):Bool;
  @:native("is_leaveok") static public function is_leaveok(win:Pointer<Window>):Bool;
  @:native("is_nodelay") static public function is_nodelay(win:Pointer<Window>):Bool;
  @:native("is_notimeout") static public function is_notimeout(win:Pointer<Window>):Bool;
  @:native("is_pad") static public function is_pad(win:Pointer<Window>):Bool;
  @:native("is_scrollok") static public function is_scrollok(win:Pointer<Window>):Bool;
  @:native("is_subwin") static public function is_subwin(win:Pointer<Window>):Bool;
  @:native("is_syncok") static public function is_syncok(win:Pointer<Window>):Bool;
  @:native("wgetparent") static public function wgetparent(win:Pointer<Window>):Pointer<Window>;
  @:native("wgetdelay") static public function wgetdelay(win:Pointer<Window>):Int;
  @:native("wgetscrreg") static public function wgetscrreg(win:Pointer<Window>, top:Pointer<Int>, bottom:Pointer<Int>):Int;

	/* curs_touch(3X)*/
	@:native("touchwin") static public function touchwin(win:Pointer<Window>):STATE;
	@:native("touchline") static public function touchline(win:Pointer<Window>, start:Int, count:Int):STATE;
	@:native("untouchwin") static public function untouchwin(win:Pointer<Window>):STATE;
	@:native("wtouchln") static public function wtouchln(win:Pointer<Window>, y:Int, n:Int, changed:Int):STATE;
  @:native("is_linetouched") static public function is_linetouched(win:Pointer<Window>, line:Int):Bool;
  @:native("is_wintouched") static public function is_wintouched(win:Pointer<Window>):Bool;

	/* resizeterm(3X)**/
  @:native("is_term_resized") static public function is_term_resized(lines:Int, columns:Int):Bool;
	@:native("resize_term") static public function resize_term(lines:Int, columns:Int):STATE;
	@:native("resizeterm") static public function resizeterm(lines:Int, columns:Int):STATE;

	/* key_defined(3X)**/
	@:native("key_defined") static public function key_defined(definition:ConstPointer<Char>):Int;
	/* keybound(3X)**/
	@:native("keybound") static public function keybound(keycode:Int, count:Int):String;
	/* keyok(3X)**/
	@:native("keyok") static public function keyok(keycode:Int, enable:Bool):Int;
	/* curs_print(3X)**/
	@:native("mcprint") static public function mcprint(data:String, len:Int):Int;

	/*curs_move(3X)*/
	@:native("move") static public function move(y:Int, x:Int):STATE;
	@:native("wmove") static public function wmove(win:Pointer<Window>, y:Int, x:Int):STATE;

	/* curs_add_wchstr(3X)*/
	@:native("add_wchstr") static public function add_wchstr(wchstr:ConstPointer<CChar_t>):STATE;
	@:native("add_wchnstr") static public function add_wchnstr(wchstr:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("wadd_wchstr") static public function wadd_wchstr(win:Pointer<Window>, wchstr:ConstPointer<CChar_t>):STATE;
	@:native("wadd_wchnstr") static public function wadd_wchnstr(win:Pointer<Window>, wchstr:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("mvadd_wchstr") static public function mvadd_wchstr(y:Int, x:Int, wchstr:ConstPointer<CChar_t>):STATE;
	@:native("mvadd_wchnstr") static public function mvadd_wchnstr(y:Int, x:Int, wchstr:ConstPointer<CChar_t>, n:Int):STATE;
	@:native("mvwadd_wchstr") static public function mvwadd_wchstr(win:Pointer<Window>, y:Int, x:Int, wchstr:ConstPointer<CChar_t>):STATE;
	@:native("mvwadd_wchnstr") static public function mvwadd_wchnstr(win:Pointer<Window>, y:Int, x:Int, wchstr:ConstPointer<CChar_t>, n:Int):STATE;

	/* curs_printw(3X)*/
	//@:native("") static public function printw(const char *fmt, ...):STATE;
	//@:native("") static public function wprintw(win:Pointer<Window>, const char *fmt, ...):STATE;
	//@:native("") static public function mvprintw(y:Int, x:Int, const char *fmt, ...):STATE;
	//@:native("") static public function mvwprintw(win:Pointer<Window>, y:Int, x:Int, const char *fmt, ...):STATE;
	//@:native("") static public function vwprintw(win:Pointer<Window>, const char *fmt, va_list varglist):STATE;
	//@:native("") static public function vw_printw(win:Pointer<Window>, const char *fmt, va_list varglist):STATE;

	///* curs_scanw(3X)*/
	//@:native("") static public function scanw(char *fmt, ...):Int;
	//@:native("") static public function wscanw(win:Pointer<Window>, char *fmt, ...):Int;
	//@:native("") static public function mvscanw(y:Int, x:Int, char *fmt, ...):Int;
	//@:native("") static public function mvwscanw(win:Pointer<Window>, y:Int, x:Int, char *fmt, ...):Int;
	//@:native("") static public function vw_scanw(win:Pointer<Window>, char *fmt, va_list varglist):Int;
	//@:native("") static public function vwscanw(win:Pointer<Window>, char *fmt, va_list varglist):Int;

	/* curs_pad(3X)*/
  @:native("newpad") static public function newpad(nlines:Int, ncols:Int):Pointer<Window>;
  @:native("funcsubpad") static public function funcsubpad(orig:Pointer<Window>, nlines:Int, ncols:Int,
             begin_y:Int, begin_x:Int):Pointer<Window>;
	@:native("prefresh") static public function prefresh(pad:Pointer<Window>, pminrow:Int, pmincol:Int,
             sminrow:Int, smincol:Int, smaxrow:Int, smaxcol:Int):STATE;
	@:native("pnoutrefresh") static public function pnoutrefresh(pad:Pointer<Window>, pminrow:Int, pmincol:Int,
             sminrow:Int, smincol:Int, smaxrow:Int, smaxcol:Int):STATE;
	@:native("pechochar") static public function pechochar(pad:Pointer<Window>, ch:CHType):STATE;
	@:native("pecho_wchar") static public function pecho_wchar(pad:Pointer<Window>, wch:ConstPointer<CChar_t>):STATE;

	/*curs_scr_dump(3X)*/
	@:native("scr_dump") static public function scr_dump(filename:String):STATE;
	@:native("scr_restore") static public function scr_restore(filename:String):STATE;
	@:native("scr_init") static public function scr_init(filename:String):STATE;
	@:native("scr_set") static public function scr_set(filename:String):STATE;

	/* curs_scroll(3X)*/
	@:native("scroll") static public function scroll(win:Pointer<Window>):STATE;
	@:native("scrl") static public function scrl(n:Int):STATE;
	@:native("wscrl") static public function wscrl(win:Pointer<Window>, n:Int):STATE;

	/* curs_slk(3X)**/
	@:native("slk_init") static public function slk_init(fmt:Int):STATE;
	@:native("slk_set") static public function slk_set(labnum:Int, label:String, fmt:Int):STATE;
	@:native("slk_refresh") static public function slk_refresh():STATE;
	@:native("slk_noutrefresh") static public function slk_noutrefresh():STATE;
  @:native("slk_label") static public function slk_label(labnum:Int):String;
	@:native("slk_clear") static public function slk_clear():STATE;
	@:native("slk_restore") static public function slk_restore():STATE;
	@:native("slk_touch") static public function slk_touch():STATE;
	@:native("slk_attron") static public function slk_attron(attrs:CHType):STATE;
	@:native("slk_attroff") static public function slk_attroff(attrs:CHType):STATE;
	@:native("slk_attrset") static public function slk_attrset(attrs:CHType):STATE;
	@:native("slk_attr_on") static public function slk_attr_on(attrs:Attrs, opts:Null):STATE;
	@:native("slk_attr_off") static public function slk_attr_off(attrs:Attrs, opts:Null):STATE;
	@:native("slk_attr_set") static public function slk_attr_set(attrs:Attrs, color_pair:Short, opts:Null):STATE;
  @:native("slk_attr") static public function slk_attr():Attrs;
	@:native("slk_color") static public function slk_color(color_pair:Short):STATE;
	@:native("slk_wset") static public function slk_wset(labnum:Int, label:ConstPointer<WChar_t>, fmt:Int):STATE;

	/* curs_termcap(3X)*/
	@:native("tgetent") static public function tgetent(bp:String, name:String):STATE;
	@:native("tgetflag") static public function tgetflag(id:String):STATE;
	@:native("tgetnum") static public function tgetnum(id:String):STATE;
  //@:native("tgetstr") static public function tgetstr(id:String, *:Stringarea):String;
  @:native("tgoto") static public function tgoto(cap:String, col:Int, row:Int):String;
	//@:native("tputs") static public function tputs(str:String, affcnt:Int, int (*putc)(int)):STATE;

	/* wresize(3X)**/
	@:native("") static public function wresize(win:Pointer<Window>, lines:Int, columns:Int):STATE;

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

@:native("wchar_t")
@:final extern class WChar_t{}

@:native("TERMINAL")
@:final extern class Terminal{}

@:native("SCREEN")
@:final extern class Screen{}

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

@:native("chtype")
@:final extern abstract CHType(UInt32) from Int{}
@:final @:enum extern abstract CHType_Const(CHType) to CHType{
/* VT100 symbols begin here */
	@:native("ACS_ULCORNER") var ACS_ULCORNER;  // NCURSES_ACS('l') /* upper left corner */
	@:native("ACS_LLCORNER") var ACS_LLCORNER;  // NCURSES_ACS('m') /* lower left corner */
	@:native("ACS_URCORNER") var ACS_URCORNER;  // NCURSES_ACS('k') /* upper right corner */
	@:native("ACS_LRCORNER") var ACS_LRCORNER;  // NCURSES_ACS('j') /* lower right corner */
	@:native("ACS_LTEE") var ACS_LTEE;  // NCURSES_ACS('t') /* tee pointing right */
	@:native("ACS_RTEE") var ACS_RTEE;  // NCURSES_ACS('u') /* tee pointing left */
	@:native("ACS_BTEE") var ACS_BTEE;  // NCURSES_ACS('v') /* tee pointing up */
	@:native("ACS_TTEE") var ACS_TTEE;  // NCURSES_ACS('w') /* tee pointing down */
	@:native("ACS_HLINE") var ACS_HLINE; // NCURSES_ACS('q') /* horizontal line */
	@:native("ACS_VLINE") var ACS_VLINE; // NCURSES_ACS('x') /* vertical line */
	@:native("ACS_PLUS") var ACS_PLUS;  // NCURSES_ACS('n') /* large plus or crossover */
	@:native("ACS_S1") var ACS_S1;    // NCURSES_ACS('o') /* scan line 1 */
	@:native("ACS_S9") var ACS_S9;    // NCURSES_ACS('s') /* scan line 9 */
	@:native("ACS_DIAMOND") var ACS_DIAMOND; // NCURSES_ACS('`') /* diamond */
	@:native("ACS_CKBOARD") var ACS_CKBOARD; // NCURSES_ACS('a') /* checker board (stipple) */
	@:native("ACS_DEGREE") var ACS_DEGREE;  // NCURSES_ACS('f') /* degree symbol */
	@:native("ACS_PLMINUS") var ACS_PLMINUS; // NCURSES_ACS('g') /* plus/minus */
	@:native("ACS_BULLET") var ACS_BULLET;  // NCURSES_ACS('~') /* bullet */

	/* Teletype 5410v1 symbols begin here */
	@:native("ACS_LARROW") var ACS_LARROW;  // NCURSES_ACS(',') /* arrow pointing left */
	@:native("ACS_RARROW") var ACS_RARROW;  // NCURSES_ACS('+') /* arrow pointing right */
	@:native("ACS_DARROW") var ACS_DARROW;  // NCURSES_ACS('.') /* arrow pointing down */
	@:native("ACS_UARROW") var ACS_UARROW;  // NCURSES_ACS('-') /* arrow pointing up */
	@:native("ACS_BOARD") var ACS_BOARD; // NCURSES_ACS('h') /* board of squares */
	@:native("ACS_LANTERN") var ACS_LANTERN; // NCURSES_ACS('i') /* lantern symbol */
	@:native("ACS_BLOCK") var ACS_BLOCK; // NCURSES_ACS('0') /* solid square block */

	/*
	* These aren't documented, but a lot of System Vs have them anyway
	* (you can spot pprryyzz{{||}} in a lot of AT&T terminfo strings).
	* The ACS_names may not match AT&T's, our source didn't know them.
	*/
	@:native("ACS_S3") var ACS_S3;    // NCURSES_ACS('p') /* scan line 3 */
	@:native("ACS_S7") var ACS_S7;    // NCURSES_ACS('r') /* scan line 7 */
	@:native("ACS_LEQUAL") var ACS_LEQUAL;  // NCURSES_ACS('y') /* less/equal */
	@:native("ACS_GEQUAL") var ACS_GEQUAL;  // NCURSES_ACS('z') /* greater/equal */
	@:native("ACS_PI") var ACS_PI;    // NCURSES_ACS('{') /* Pi */
	@:native("ACS_NEQUAL") var ACS_NEQUAL;  // NCURSES_ACS('|') /* not equal */
	@:native("ACS_STERLING") var ACS_STERLING;  // NCURSES_ACS('}') /* UK pound sign */

	/*
	* Line drawing ACS names are of the form ACS_trbl, where t is the top, r
	* is the right, b is the bottom, and l is the left.  t, r, b, and l might
	* be B (blank), S (single), D (double), or T (thick).  The subset defined
	* here only uses B and S.
	*/
	@:native("ACS_BSSB") var ACS_BSSB;  // ACS_ULCORNER
	@:native("ACS_SSBB") var ACS_SSBB;  // ACS_LLCORNER
	@:native("ACS_BBSS") var ACS_BBSS;  // ACS_URCORNER
	@:native("ACS_SBBS") var ACS_SBBS;  // ACS_LRCORNER
	@:native("ACS_SBSS") var ACS_SBSS;  // ACS_RTEE
	@:native("ACS_SSSB") var ACS_SSSB;  // ACS_LTEE
	@:native("ACS_SSBS") var ACS_SSBS;  // ACS_BTEE
	@:native("ACS_BSSS") var ACS_BSSS;  // ACS_TTEE
	@:native("ACS_BSBS") var ACS_BSBS;  // ACS_HLINE
	@:native("ACS_SBSB") var ACS_SBSB;  // ACS_VLINE
	@:native("ACS_SSSS") var ACS_SSSS;  // ACS_PLUS
}
