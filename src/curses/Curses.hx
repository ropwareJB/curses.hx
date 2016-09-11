package curses;

import curses.RGB;

#if python
	import curses.py.Curses as PyCurses;
	typedef CURS_VISIBILITY = curses.py.Curses.CURS_VISIBILITY;
#elseif cpp
	import curses.cpp.Curses as CppCurses;
	import cpp.AtomicInt;
	typedef CURS_VISIBILITY = curses.cpp.Curses.CURS_VISIBILITY;
	typedef MMask_t = curses.cpp.Curses.MMask_t;
	typedef MEVENT = curses.cpp.Curses.MEVENT;
#end

typedef ColorPair = {
	var fg:Int;
	var bg:Int;
};

@:final class Curses{

	public static var COLORS(get,never):Int;

	public static function get_COLORS(){
		#if python
			return PyCurses.COLORS;
		#elseif cpp
			return CppCurses.COLORS;
		#end
	}
	
	public static function baudrate():Int{
		/* Return the output speed of the terminal in bits per second. On software terminal emulators it will have a fixed high value. Included for historical reasons; in former times, it was used to write output loops for time delays and occasionally to change interfaces depending on the line speed.*/
		#if python
			return PyCurses.baudrate();
		#elseif cpp
			return CppCurses.baudrate();
		#end
	}

  public static function beep():Void{
		/* Emit a short attention sound.*/
		#if python
			PyCurses.beep();
		#elseif cpp
			CppCurses.beep();
		#end
	}

  public static function canChangeColor():Bool{
		/* Return True or False, depending on whether the programmer can change the colors displayed by the terminal.*/
		#if python
			return PyCurses.can_change_color();
		#elseif cpp
			return CppCurses.can_change_color();
		#end
	}

  public static function cbreak():Void{
		/* Enter cbreak mode. In cbreak mode (sometimes called “rare” mode) normal tty line buffering is turned off and characters are available to be read one by one. However, unlike raw mode, special characters (interrupt, quit, suspend, and flow control) retain their effects on the tty driver and calling program. Calling first raw() then cbreak() leaves the terminal in cbreak mode. */
		#if python
			PyCurses.cbreak();
		#elseif cpp
			CppCurses.cbreak();
		#end
	}

  public static function colorContent(color_number:Int):RGB{
		/* Return the intensity of the red, green, and blue (RGB) components in the color color_number, which must be between 0 and COLORS. A 3-tuple is returned, containing the R,G,B values for the given color, which will be between 0 (no component) and 1000 (maximum amount of component). */
		#if python
			var tup3 = PyCurses.color_content(color_number).toArray();
			return new RGB(tup3[0], tup3[1], tup3[2]);
		#elseif cpp
			var r:cpp.Pointer<cpp.Int16> = cpp.Stdlib.malloc(cpp.Stdlib.sizeof(cpp.Int16));
			var g:cpp.Pointer<cpp.Int16> = cpp.Stdlib.malloc(cpp.Stdlib.sizeof(cpp.Int16)); 
			var b:cpp.Pointer<cpp.Int16> = cpp.Stdlib.malloc(cpp.Stdlib.sizeof(cpp.Int16));
			CppCurses.color_content(color_number, r, g, b);
			return new RGB(r.ref, g.ref, b.ref);
		#end
	}

  public static function colorPair(color_number:Int):Int{
		/* Return the attribute value for displaying text in the specified color. This attribute value can be combined with A_STANDOUT, A_REVERSE, and the other A_* attributes. pair_number() is the counterpart to this function. */
		#if python
			return PyCurses.color_pair(color_number);
		#elseif cpp
			return CppCurses.color_pair(color_number);
		#end
	}

  public static function cursSet(visibility:CURS_VISIBILITY):Void{
		/* Set the cursor state. visibility can be set to 0, 1, or 2, for invisible, normal, or very visible. If the terminal supports the visibility requested, the previous cursor state is returned; otherwise, an exception is raised. On many terminals, the “visible” mode is an underline cursor and the “very visible” mode is a block cursor.*/
		#if python
			PyCurses.curs_set(visibility);
		#elseif cpp
			CppCurses.curs_set(visibility);
		#end
	}

  public static function def_progMode():Void{
		/* Save the current terminal mode as the “program” mode, the mode when the running program is using curses. (Its counterpart is the “shell” mode, for when the program is not in curses.) Subsequent calls to reset_prog_mode() will restore this mode. */
		#if python
			PyCurses.def_prog_mode();
		#elseif cpp
			CppCurses.def_prog_mode();
		#end
	}

  public static function def_shellMode():Void{
		/* Save the current terminal mode as the “shell” mode, the mode when the running program is not using curses. (Its counterpart is the “program” mode, when the program is using curses capabilities.) Subsequent calls to reset_shell_mode() will restore this mode. */
		#if python
			PyCurses.def_shell_mode();
		#elseif cpp
			CppCurses.def_shell_mode();
		#end
	}

  public static function delayOutput(ms:Int):Void{
		/* Insert an ms millisecond pause in output. */
		#if python
			PyCurses.delay_output(ms);
		#elseif cpp
			CppCurses.delay_output(ms);
		#end
	}

  public static function doUpdate():Void{
		/* Update the physical screen. The curses library keeps two data structures, one representing the current physical screen contents and a virtual screen representing the desired next state. The doupdate() ground updates the physical screen to match the virtual screen. */
  /* The virtual screen may be updated by a noutrefresh() call after write operations such as addstr() have been performed on a window. The normal refresh() call is simply noutrefresh() followed by doupdate(); if you have to update multiple windows, you can speed performance and perhaps reduce screen flicker by issuing noutrefresh() calls on all windows, followed by a single doupdate(). */
		#if python
			PyCurses.doupdate();
		#elseif cpp
			CppCurses.doupdate();
		#end
	}

  public static function echo():Void{
		/* Enter echo mode. In echo mode, each character input is echoed to the screen as it is entered. */
		#if python
			PyCurses.echo();
		#elseif cpp
			CppCurses.echo();
		#end
	}

  public static function endwin():Void{
		/* De-initialize the library, and return terminal to normal status. */
		#if python
			PyCurses.endwin();
		#elseif cpp
		#end
	}

  public static function eraseChar():Int{
		/* Return the user’s current erase character. Under Unix operating systems this is a property of the controlling tty of the curses program, and is not set by the curses library itself. */
		#if python
			return PyCurses.erasechar();
		#elseif cpp
			return CppCurses.erasechar();
		#end
	}

  public static function filter():Void{
		/* The filter() routine, if used, must be called before initscr() is called. The effect is that, during those calls, LINES is set to 1; the capabilities clear, cup, cud, cud1, cuu1, cuu, vpa are disabled; and the home string is set to the value of cr. The effect is that the cursor is confined to the current line, and so are screen updates. This may be used for enabling character-at-a-time line editing without touching the rest of the screen. */
		#if python
			PyCurses.filter();
		#elseif cpp
			CppCurses.filter();
		#end
	}

  public static function flash():Void{
		/* Flash the screen. That is, change it to reverse-video and then change it back in a short interval. Some people prefer such as ‘visible bell’ to the audible attention signal produced by beep(). */
		#if python
			PyCurses.flash();
		#elseif cpp
			CppCurses.flash();
		#end
	}

  public static function flushinp():Void{
		/* Flush all input buffers. This throws away any typeahead that has been typed by the user and has not yet been processed by the program. */
		#if python
			PyCurses.flushinp();
		#elseif cpp
			CppCurses.flushinp();
		#end
	}

 public static function getMouse():MouseState{
		/* After getch() returns KEY_MOUSE to signal a mouse event, this method should be call to retrieve the queued mouse event, represented as a 5-tuple (id, x, y, z, bstate). id is an ID value used to distinguish multiple devices, and x, y, z are the event’s coordinates. (z is currently unused.) bstate is an integer value whose bits will be set to indicate the type of event, and will be the bitwise OR of one or more of the following constants, where n is the button number from 1 to 4: BUTTONn_PRESSED, BUTTONn_RELEASED, BUTTONn_CLICKED, BUTTONn_DOUBLE_CLICKED, BUTTONn_TRIPLE_CLICKED, BUTTON_SHIFT, BUTTON_CTRL, BUTTON_ALT. */
		#if python
			var tup = PyCurses.getmouse();
			return new MouseState(tup[0], tup[1], tup[2], tup[3], tup[4]);
		#elseif cpp
			var tmp:cpp.Pointer<MEVENT> = MEVENT.create();
			CppCurses.getmouse(tmp);
			return new MouseState(tmp.ref.id, tmp.ref.x, tmp.ref.y, tmp.ref.z, tmp.ref.bstate);
		#end
	}

  public static function getCursorPos():Point{
		/* Return the current coordinates of the virtual screen cursor in y and x. If leaveok is currently true, then -1,-1 is returned. */
		#if python
			var tup:python.Tuple.Tuple2<Int,Int> = PyCurses.getsyx();
			return new Point(tup[1], tup[0]);
		#elseif cpp
			var x:Int=0, y:Int=0;
			CppCurses.getsyx(y,x);
			return new Point(x,y);
		#end
	}

  public static function getWin(file:String):Window{
		/* Read window related data stored in the file by an earlier putwin() call. The routine then creates and initializes a new window using that data, returning the new window object. */
		#if python
			return PyCurses.getwin(file);
		#elseif cpp
			//return PyCurses.getwin(file);
			// TODO
			return null;
		#end
	}

  public static function hasColors():Bool{
		/* Return True if the terminal can display colors; otherwise, return False. */
		#if python
			return PyCurses.has_colors();
		#elseif cpp
			return CppCurses.has_colors();
		#end
	}

  public static function hasIC():Bool{
		/* Return True if the terminal has insert- and delete-character capabilities. This function is included for historical reasons only, as all modern software terminal emulators have such capabilities. */
		#if python
			return PyCurses.has_ic();
		#elseif cpp
			return CppCurses.has_ic();
		#end
	}

  public static function hasIL():Bool{
		/* Return True if the terminal has insert- and delete-line capabilities, or can simulate them using scrolling regions. This function is included for historical reasons only, as all modern software terminal emulators have such capabilities. */
		#if python
			return PyCurses.has_il();
		#elseif cpp
			return CppCurses.has_il();
		#end
	}

  public static function hasKey(ch:Int):Bool{
		/* Take a key value ch, and return True if the current terminal type recognizes a key with that value. */
		#if python
			return PyCurses.has_key(ch);
		#elseif cpp
			return CppCurses.has_key(ch)!=0;
		#end
	}

  public static function halfDelay(tenths:Int):Void{
		/* Used for half-delay mode, which is similar to cbreak mode in that characters typed by the user are immediately available to the program. However, after blocking for tenths tenths of seconds, an exception is raised if nothing has been typed. The value of tenths must be a number between 1 and 255. Use nocbreak() to leave half-delay mode. */
		#if python
			PyCurses.halfdelay(tenths);
		#elseif cpp
			CppCurses.halfdelay(tenths);
		#end
	}

  public static function initColor(color_number:Int, r:Int, g:Int, b:Int):Void{
		/* Change the definition of a color, taking the number of the color to be changed followed by three RGB values (for the amounts of red, green, and blue components). The value of color_number must be between 0 and COLORS. Each of r, g, b, must be a value between 0 and 1000. When init_color() is used, all occurrences of that color on the screen immediately change to the new definition. This function is a no-op on most terminals; it is active only if can_change_color() returns 1. */
		#if python
			PyCurses.init_color(color_number, r, g, b);
		#elseif cpp
			CppCurses.init_color(color_number, r, g, b);
		#end
	}

  public static function initPair(pair_number:Int, fg:Int, bg:Int):Void{
		/* Change the definition of a color-pair. It takes three arguments: the number of the color-pair to be changed, the foreground color number, and the background color number. The value of pair_number must be between 1 and COLOR_PAIRS - 1 (the 0 color pair is wired to white on black and cannot be changed). The value of fg and bg arguments must be between 0 and COLORS. If the color-pair was previously initialized, the screen is refreshed and all occurrences of that color-pair are changed to the new definition. */
		#if python
			PyCurses.init_pair(pair_number, fg, bg);
		#elseif cpp
			CppCurses.init_pair(pair_number, fg, bg);
		#end
	}

  public static function initScreen():Window{
		/* Initialize the library. Return a Window which represents the whole screen. */
  /* Note If there is an error opening the terminal, the underlying curses library may cause the interpreter to exit. */
		#if python
			return PyCurses.initscr();
		#elseif cpp
			return CppCurses.initscr();
		#end
	}

  public static function isTermResized(nlines:Int, ncols:Int):Bool{
		/* Return True if resize_term() would modify the window structure, False otherwise. */
		#if python
			return PyCurses.is_term_resized(nlines, ncols);
		#elseif cpp
			return CppCurses.is_term_resized(nlines, ncols);
		#end
	}

  public static function isEndWin():Bool{
		/* Return True if endwin() has been called (that is, the curses library has been deinitialized). */
		#if python
			return PyCurses.isendwin();
		#elseif cpp
			return CppCurses.isendwin();
		#end
	}

  public static function keyname(k:Int):String{
		/* Return the name of the key numbered k. The name of a key generating printable ASCII character is the key’s character. The name of a control-key combination is a two-character string consisting of a caret followed by the corresponding printable ASCII character. The name of an alt-key combination (128-255) is a string consisting of the prefix ‘M-‘ followed by the name of the corresponding ASCII character. */
		#if python
			return PyCurses.keyname(k);
		#elseif cpp
			return CppCurses.keyname(k);
		#end
	}

  public static function killChar():String{
		/* Return the user’s current line kill character. Under Unix operating systems this is a property of the controlling tty of the curses program, and is not set by the curses library itself. */
		#if python
			return PyCurses.killchar();
		#elseif cpp
			return CppCurses.killchar();
		#end
	}

  public static function longName():String{
		/* Return a string containing the terminfo long name field describing the current terminal. The maximum length of a verbose description is 128 characters. It is defined only after the call to initscr(). */
		#if python
			return PyCurses.longname();
		#elseif cpp
			return CppCurses.longname();
		#end
	}

  public static function meta(yes:Int):Void{
		/* If yes is 1, allow 8-bit characters to be input. If yes is 0, allow only 7-bit chars. */
		#if python
			PyCurses.meta(yes);
		#elseif cpp
			// TODO
		#end
	}

  public static function mouseInterval(interval:Int):Void{
		/* Set the maximum time in milliseconds that can elapse between press and release events in order for them to be recognized as a click, and return the previous interval value. The default value is 200 msec, or one fifth of a second. */
		#if python
			PyCurses.mouseinterval(interval);
		#elseif cpp
			CppCurses.mouseinterval(interval);
		#end
	}

  public static function mouseMask(mmmask:Int):MouseMaskState{
		/* Set the mouse events to be reported, and return a tuple (availmask, oldmask). availmask indicates which of the specified mouse events can be reported; on complete failure it returns 0. oldmask is the previous value of the given window’s mouse event mask. If this function is never called, no mouse events are ever reported. */
		#if python
			var tup:python.Tuple.Tuple2<Int,Int> = PyCurses.mousemask(mmmask);
			return new MouseMaskState(tup[0], tup[1]);
		#elseif cpp
			var old:MMask_t = 0;
			var avail:MMask_t = CppCurses.mousemask(mmmask, cpp.Pointer.addressOf(old));
			return new MouseMaskState(avail, old);
		#end
	}

  public static function nap(ms:Int):Void{
		/* Sleep for ms milliseconds. */
		#if python
			PyCurses.napms(ms);
		#elseif cpp
			CppCurses.napms(ms);
		#end
	}

  public static function newPad(nlines:Int, ncols:Int):Window{
		/* Create and return a pointer to a new pad data structure with the given number of lines and columns. A pad is returned as a window object. */

  /* A pad is like a window, except that it is not restricted by the screen size, and is not necessarily associated with a particular part of the screen. Pads can be used when a large window is needed, and only a part of the window will be on the screen at one time. Automatic refreshes of pads (such as from scrolling or echoing of input) do not occur. The refresh() and noutrefresh() methods of a pad require 6 arguments to specify the part of the pad to be displayed and the location on the screen to be used for the display. The arguments are pminrow, pmincol, sminrow, smincol, smaxrow, smaxcol; the p arguments refer to the upper left corner of the pad region to be displayed and the s arguments define a clipping box on the screen within which the pad region is to be displayed. */
		#if python
			return PyCurses.newpad(nlines, ncols);
		#elseif cpp
			return CppCurses.newpad(nlines, ncols);
		#end
	}

  public static function newWin(nlines:Int, ncols:Int, ?begin_y:Int, ?begin_x:Int):Window{
		/* Return a new window, whose left-upper corner is at (begin_y, begin_x), and whose height/width is nlines/ncols. */
  /* By default, the window will extend from the specified position to the lower right corner of the screen. */
		#if python
			if(begin_y == null || begin_x == null) return PyCurses.newwin(nlines, ncols);
			else return PyCurses.newwin(nlines, ncols, begin_y, begin_x);
		#elseif cpp
			if(begin_y == null || begin_x == null) return CppCurses.newwin(nlines, ncols, 0, 0);
			else return CppCurses.newwin(nlines, ncols, begin_y, begin_x);
		#end
	}

  public static function nl():Void{
		/* Enter newline mode. This mode translates the return key into newline on input, and translates newline into return and line-feed on output. Newline mode is initially on. */
		#if python
			PyCurses.nl();
		#elseif cpp
			CppCurses.nl();
		#end
	}

  public static function noCBreak():Void{
		/* Leave cbreak mode. Return to normal “cooked” mode with line buffering. */
		#if python
			PyCurses.nocbreak();
		#elseif cpp
			CppCurses.nocbreak();
		#end
	}

  public static function noEcho():Void{
		/* Leave echo mode. Echoing of input characters is turned off. */
		#if python
			PyCurses.noecho();
		#elseif cpp
			CppCurses.noecho();
		#end
	}

  public static function noNewline():Void{
		/* Leave newline mode. Disable translation of return into newline on input, and disable low-level translation of newline into newline/return on output (but this does not change the behavior of addch('\n'), which always does the equivalent of return and line feed on the virtual screen). With translation off, curses can sometimes speed up vertical motion a little; also, it will be able to detect the return key on input. */
		#if python
			PyCurses.nonl();
		#elseif cpp
			CppCurses.nonl();
		#end
	}

  public static function noQiFlush():Void{
		/* When the noqiflush() routine is used, normal flush of input and output queues associated with the INTR, QUIT and SUSP characters will not be done. You may want to call noqiflush() in a signal handler if you want output to continue as though the interrupt had not occurred, after the handler exits. */
		#if python
			PyCurses.noqiflush();
		#elseif cpp
			CppCurses.noqiflush();
		#end
	}

  public static function noRaw():Void{
		/* Leave raw mode. Return to normal “cooked” mode with line buffering. */
		#if python
			PyCurses.noraw();
		#elseif cpp
			CppCurses.noraw();
		#end
	}

  public static function pairContent(pair_number:Int):ColorPair{
		/* Return a tuple (fg, bg) containing the colors for the requested color pair. The value of pair_number must be between 1 and COLOR_PAIRS - 1. */
		#if python
			var tup:python.Tuple.Tuple2<Int,Int> = PyCurses.pair_content(pair_number);
			return {fg:tup[0], bg:tup[1]};
		#elseif cpp
			var f:cpp.Pointer<cpp.Int16> = cpp.Stdlib.malloc(cpp.Stdlib.sizeof(cpp.Int16));
			var b:cpp.Pointer<cpp.Int16> = cpp.Stdlib.malloc(cpp.Stdlib.sizeof(cpp.Int16));
			CppCurses.pair_content(pair_number, f, b);
			return {fg:f.ref, bg:b.ref};
		#end
	}

  public static function pairNumber(attr:Int):Int{
		/* Return the number of the color-pair set by the attribute value attr. color_pair() is the counterpart to this function. */
		#if python
			return PyCurses.pair_number(attr);
		#elseif cpp
			// TODO 
			return 0;
		#end
	}

  public static function putP(string:String):Void{
		/* Equivalent to tputs(str, 1, putchar); emit the value of a specified terminfo capability for the current terminal. Note that the output of putp() always goes to standard output. */
		#if python
			PyCurses.putp(string);
		#elseif cpp
			CppCurses.putp(string);
		#end
	}

  public static function qiFlush(flag:Bool=true):Void{
		/* If flag is False, the effect is the same as calling noqiflush(). If flag is True, or no argument is provided, the queues will be flushed when these control characters are read. */
		#if python
			PyCurses.qiflush(flag);
		#elseif cpp
			if(flag) CppCurses.qiflush();
			else CppCurses.noqiflush();
		#end
	}

  public static function raw():Void{
		/* Enter raw mode. In raw mode, normal line buffering and processing of interrupt, quit, suspend, and flow control keys are turned off; characters are presented to curses input functions one by one. */
		#if python
			PyCurses.raw();
		#elseif cpp
			CppCurses.raw();
		#end
	}

  public static function resetProgMode():Void{
		/* Restore the terminal to “program” mode, as previously saved by def_prog_mode(). */
		#if python
			PyCurses.reset_prog_mode();
		#elseif cpp
			CppCurses.reset_prog_mode();
		#end
	}

  public static function resetShellMode():Void{
		/* Restore the terminal to “shell” mode, as previously saved by def_shell_mode(). */
		#if python
			PyCurses.reset_shell_mode();
		#elseif cpp
			CppCurses.reset_shell_mode();
		#end
	}

  public static function resetTy():Void{
		/* Restore the state of the terminal modes to what it was at the last call to savetty(). */
		#if python
			PyCurses.resetty();
		#elseif cpp
			CppCurses.resetty();
		#end
	}

 public static function resizeTerm(nlines:Int, ncols:Int):Void{
		/* Backend function used by resizeterm(), performing most of the work; when resizing the windows, resize_term() blank-fills the areas that are extended. The calling application should fill in these areas with appropriate data. The resize_term() function attempts to resize all windows. However, due to the calling convention of pads, it is not possible to resize these without additional interaction with the application. */
		#if python
			PyCurses.resize_term(nlines, ncols);
		#elseif cpp
			CppCurses.resize_term(nlines, ncols);
		#end
	}

  public static function saveTty():Void{
		/* Save the current state of the terminal modes in a buffer, usable by resetty(). */
		#if python
			PyCurses.savetty();
		#elseif cpp
			CppCurses.savetty();
		#end
	}

  public static function setCursorPos(y:Int, x:Int):Void{
		/* Set the virtual screen cursor to y, x. If y and x are both -1, then leaveok is set. */
		#if python
			PyCurses.setsyx(y, x);
		#elseif cpp
			CppCurses.setsyx(y, x);
		#end
	}

  //public static function setupTerm(?termstr:String, ?fd:python.lib.FileObject):Void{
	//	/* Initialize the terminal. termstr is a string giving the terminal name; if omitted, the value of the TERM environment variable will be used. fd is the file descriptor to which any initialization sequences will be sent; if not supplied, the file descriptor for sys.stdout will be used. */
	//	#if python
	//		PyCurses.setupterm(termstr, fd);
	//	#elseif cpp
	//	#end
	//}

  public static function startColor():Void{
		/* Must be called if the programmer wants to use colors, and before any other color manipulation routine is called. It is good practice to call this routine right after initscr(). */
  /* start_color() initializes eight basic colors (black, red, green, yellow, blue, magenta, cyan, and white), and two global variables in the curses module, COLORS and COLOR_PAIRS, containing the maximum number of colors and color-pairs the terminal can support. It also restores the colors on the terminal to the values they had when the terminal was just turned on. */
		#if python
			PyCurses.start_color();
		#elseif cpp
			CppCurses.start_color();
		#end
	}

  public static function termAttrs():Int{
		/* Return a logical OR of all video attributes supported by the terminal. This information is useful when a curses program needs complete control over the appearance of the screen. */
		#if python
			return PyCurses.termattrs();
		#elseif cpp
			return CppCurses.termattrs();
		#end
	}

  public static function termName():String{
		/* Return the value of the environment variable TERM, truncated to 14 characters. */
		#if python
			return PyCurses.termname();
		#elseif cpp
			return CppCurses.termname();
		#end
	}

  public static function tigetFlag(capname:String):Int{
		/* Return the value of the Boolean capability corresponding to the terminfo capability name capname. The value -1 is returned if capname is not a Boolean capability, or 0 if it is canceled or absent from the terminal description. */
		#if python
			return PyCurses.tigetflag(capname);
		#elseif cpp
			return CppCurses.tigetflag(capname);
		#end
	}

  public static function tigetNum(capname:String):Int{
		/* Return the value of the numeric capability corresponding to the terminfo capability name capname. The value -2 is returned if capname is not a numeric capability, or -1 if it is canceled or absent from the terminal description. */
		#if python
			return PyCurses.tigetnum(capname);
		#elseif cpp
			return CppCurses.tigetnum(capname);
		#end
	}

  public static function tigetStr(capname:String):String{
		/* Return the value of the string capability corresponding to the terminfo capability name capname. None is returned if capname is not a string capability, or is canceled or absent from the terminal description. */
		#if python
			return PyCurses.tigetstr(capname);
		#elseif cpp
			return CppCurses.tigetstr(capname);
		#end
	}

  public static function tparm(str:String):Void{
		/* Instantiate the string str with the supplied parameters, where str should be a parameterized string obtained from the terminfo database. E.g. tparm(tigetstr("cup"), 5, 3) could result in b'\033[6;4H', the exact result depending on terminal type. */
		#if python
			PyCurses.tparm(str);
		#elseif cpp
			CppCurses.tparm(str);
		#end
	}

  //public static function typeAhead(fd:python.lib.FileObject):Void{
	//	/* Specify that the file descriptor fd be used for typeahead checking. If fd is -1, then no typeahead checking is done. */

  ///* The curses library does “line-breakout optimization” by looking for typeahead periodically while updating the screen. If input is found, and it is coming from a tty, the current update is postponed until refresh or doupdate is called again, allowing faster response to commands typed in advance. This function allows specifying a different file descriptor for typeahead checking. */
	//	#if python
	//		PyCurses.typeahead(fd);
	//	#elseif cpp
	//	#end
	//} TODO

  public static function unctrl(ch:Int):String{
		/* Return a string which is a printable representation of the character ch. Control characters are displayed as a caret followed by the character, for example as ^C. Printing characters are left as they are. */
		#if python
			return PyCurses.unctrl(ch);
		#elseif cpp
			return CppCurses.unctrl(ch);
		#end
	}

  public static function ungetCh(ch:Int):Void{
		/* Push ch so the next getch() will return it. */
  /* Note Only one ch can be pushed before getch() is called. */
		#if python
			PyCurses.ungetch(ch);
		#elseif cpp
			CppCurses.ungetch(ch);
		#end
	}

  public static function updateLinesCols():Void{
		/* Update LINES and COLS. Useful for detecting manual screen resize. */
  /* New in version 3.5. */
		#if python
			PyCurses.update_lines_cols();
		#elseif cpp
			//CppCurses.update_lines_cols();
			// TODO
		#end
	}

  public static function ungetWch(ch:Int):Void{
		/* Push ch so the next get_wch() will return it. */
  /* Note Only one ch can be pushed before get_wch() is called. */
  /* New in version 3.3. */
		#if python
			PyCurses.unget_wch(ch);
		#elseif cpp
			CppCurses.unget_wch(ch);
		#end
	}

  public static function ungetMouse(id:Int, x:Int, y:Int, z:Int, bstate:Int):Void{
		/* Push a KEY_MOUSE event onto the input queue, associating the given state data with it. */
		#if python
			PyCurses.ungetmouse(id, x, y, z, bstate);
		#elseif cpp
			var tmp:cpp.Pointer<MEVENT> = MEVENT.create();
			tmp.ref.id = id;
			tmp.ref.x = x;
			tmp.ref.y = y;
			tmp.ref.z = z;
			tmp.ref.bstate = bstate;
			CppCurses.ungetmouse(tmp);
		#end
	}

  public static function useEnv(flag:Bool):Void{
		/* If used, this function should be called before initscr() or newterm are called. When flag is False, the values of lines and columns specified in the terminfo database will be used, even if environment variables LINES and COLUMNS (used by default) are set, or if curses is running in a window (in which case default behavior would be to use the window size if LINES and COLUMNS are not set). */
		#if python
			PyCurses.use_env(flag);
		#elseif cpp
			CppCurses.use_env(flag);
		#end
	}

  public static function useDefaultColors():Void{
		/* Allow use of default values for colors on terminals supporting this feature. Use this to support transparency in your application. The default color is assigned to the color number -1. After calling this function, init_pair(x, curses.COLOR_RED, -1) initializes, for instance, color pair x to a red foreground color on the default background. */
		#if python
			PyCurses.use_default_colors();
		#elseif cpp
			CppCurses.use_default_colors();
		#end
	}

  public static function wrapper(func:Window->Array<Dynamic>->Void, xs:Array<Dynamic>):Void{
		/* Initialize curses and call another callable object, func, which should be the rest of your curses-using application. If the application raises an exception, this function will restore the terminal to a sane state before re-raising the exception and generating a traceback. The callable object func is then passed the main window ‘stdscr’ as its first argument, followed by any other arguments passed to wrapper(). Before calling func, wrapper() turns on cbreak mode, turns off echo, enables the terminal keypad, and initializes colors if the terminal has color support. On exit (whether normally or by exception) it restores cooked mode, turns on echo, and disables the terminal keypad. */
		#if python
			PyCurses.wrapper(func, xs);
		#elseif cpp
			throw "Not supported in C++ target.";
		#end
	}

}
