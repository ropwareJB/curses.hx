package curses.py;

import python.Tuple3;

@:enum abstract CURS_VISIBLITY(Int) to Int{
	var INVISIBLE = 0;
	var NORMAL = 1;
	var VISIBLE = 2;
}

@:native("curses")
@:final extern class Curses{
/* https://docs.python.org/3.5/library/curses.html#module-curses */
	
	public static function baudrate():Int;
	/* Return the output speed of the terminal in bits per second. On software terminal emulators it will have a fixed high value. Included for historical reasons; in former times, it was used to write output loops for time delays and occasionally to change interfaces depending on the line speed.*/

	public static function beep():Void;
	/* Emit a short attention sound.*/

	public static function can_change_color():Bool;
	/* Return True or False, depending on whether the programmer can change the colors displayed by the terminal.*/

	public static function cbreak():Void;
	/* Enter cbreak mode. In cbreak mode (sometimes called “rare” mode) normal tty line buffering is turned off and characters are available to be read one by one. However, unlike raw mode, special characters (interrupt, quit, suspend, and flow control) retain their effects on the tty driver and calling program. Calling first raw() then cbreak() leaves the terminal in cbreak mode. */

	public static function color_content(color_number:Int):Tuple3<Int,Int,Int>;
	/* Return the intensity of the red, green, and blue (RGB) components in the color color_number, which must be between 0 and COLORS. A 3-tuple is returned, containing the R,G,B values for the given color, which will be between 0 (no component) and 1000 (maximum amount of component). */

	public static function color_pair(color_number:Int):Void;
	/* Return the attribute value for displaying text in the specified color. This attribute value can be combined with A_STANDOUT, A_REVERSE, and the other A_* attributes. pair_number() is the counterpart to this function. */

	public static function curs_set(visibility:CURS_VISIBLITY):Void;
	/* Set the cursor state. visibility can be set to 0, 1, or 2, for invisible, normal, or very visible. If the terminal supports the visibility requested, the previous cursor state is returned; otherwise, an exception is raised. On many terminals, the “visible” mode is an underline cursor and the “very visible” mode is a block cursor.*/

	public static function def_prog_mode():Void;
	/* Save the current terminal mode as the “program” mode, the mode when the running program is using curses. (Its counterpart is the “shell” mode, for when the program is not in curses.) Subsequent calls to reset_prog_mode() will restore this mode. */

	public static function def_shell_mode():Void;
	/* Save the current terminal mode as the “shell” mode, the mode when the running program is not using curses. (Its counterpart is the “program” mode, when the program is using curses capabilities.) Subsequent calls to reset_shell_mode() will restore this mode. */

	public static function delay_output(ms:Int):Void;
	/* Insert an ms millisecond pause in output. */

	public static function doupdate():Void;
	/* Update the physical screen. The curses library keeps two data structures, one representing the current physical screen contents and a virtual screen representing the desired next state. The doupdate() ground updates the physical screen to match the virtual screen. */

	/* The virtual screen may be updated by a noutrefresh() call after write operations such as addstr() have been performed on a window. The normal refresh() call is simply noutrefresh() followed by doupdate(); if you have to update multiple windows, you can speed performance and perhaps reduce screen flicker by issuing noutrefresh() calls on all windows, followed by a single doupdate(). */

	public static function echo():Void;
	/* Enter echo mode. In echo mode, each character input is echoed to the screen as it is entered. */

	public static function endwin():Void;
	/* De-initialize the library, and return terminal to normal status. */

	public static function erasechar():Int;
	/* Return the user’s current erase character. Under Unix operating systems this is a property of the controlling tty of the curses program, and is not set by the curses library itself. */

	public static function filter():Void;
	/* The filter() routine, if used, must be called before initscr() is called. The effect is that, during those calls, LINES is set to 1; the capabilities clear, cup, cud, cud1, cuu1, cuu, vpa are disabled; and the home string is set to the value of cr. The effect is that the cursor is confined to the current line, and so are screen updates. This may be used for enabling character-at-a-time line editing without touching the rest of the screen. */

	public static function flash():Void;
	/* Flash the screen. That is, change it to reverse-video and then change it back in a short interval. Some people prefer such as ‘visible bell’ to the audible attention signal produced by beep(). */

	public static function flushinp():Void;
	/* Flush all input buffers. This throws away any typeahead that has been typed by the user and has not yet been processed by the program. */

	public static function getmouse():Tuple5<Int,Int,Int,Int,Int>;
	/* After getch() returns KEY_MOUSE to signal a mouse event, this method should be call to retrieve the queued mouse event, represented as a 5-tuple (id, x, y, z, bstate). id is an ID value used to distinguish multiple devices, and x, y, z are the event’s coordinates. (z is currently unused.) bstate is an integer value whose bits will be set to indicate the type of event, and will be the bitwise OR of one or more of the following constants, where n is the button number from 1 to 4: BUTTONn_PRESSED, BUTTONn_RELEASED, BUTTONn_CLICKED, BUTTONn_DOUBLE_CLICKED, BUTTONn_TRIPLE_CLICKED, BUTTON_SHIFT, BUTTON_CTRL, BUTTON_ALT. */

	public static function getsyx():Tuple2<Int,Int>;
	/* Return the current coordinates of the virtual screen cursor in y and x. If leaveok is currently true, then -1,-1 is returned. */

	public static function getwin(file:String):Window.g;
	/* Read window related data stored in the file by an earlier putwin() call. The routine then creates and initializes a new window using that data, returning the new window object. */

	public static function has_colors():Bool;
	/* Return True if the terminal can display colors; otherwise, return False. */

	public static function has_ic():Bool;
	/* Return True if the terminal has insert- and delete-character capabilities. This function is included for historical reasons only, as all modern software terminal emulators have such capabilities. */

	public static function has_il():Bool;
	/* Return True if the terminal has insert- and delete-line capabilities, or can simulate them using scrolling regions. This function is included for historical reasons only, as all modern software terminal emulators have such capabilities. */

	public static function has_key(ch:Int):Bool;
	/* Take a key value ch, and return True if the current terminal type recognizes a key with that value. */

	public static function halfdelay(tenths:Int):Void;
	/* Used for half-delay mode, which is similar to cbreak mode in that characters typed by the user are immediately available to the program. However, after blocking for tenths tenths of seconds, an exception is raised if nothing has been typed. The value of tenths must be a number between 1 and 255. Use nocbreak() to leave half-delay mode. */

	public static function init_color(color_number:Int, r:Int, g:Int, b:Int):Void;
	/* Change the definition of a color, taking the number of the color to be changed followed by three RGB values (for the amounts of red, green, and blue components). The value of color_number must be between 0 and COLORS. Each of r, g, b, must be a value between 0 and 1000. When init_color() is used, all occurrences of that color on the screen immediately change to the new definition. This function is a no-op on most terminals; it is active only if can_change_color() returns 1. */

	public static function init_pair(pair_number:Int, fg:Int, bg:Int):Void;
	/* Change the definition of a color-pair. It takes three arguments: the number of the color-pair to be changed, the foreground color number, and the background color number. The value of pair_number must be between 1 and COLOR_PAIRS - 1 (the 0 color pair is wired to white on black and cannot be changed). The value of fg and bg arguments must be between 0 and COLORS. If the color-pair was previously initialized, the screen is refreshed and all occurrences of that color-pair are changed to the new definition. */

	public static function initscr():Window.g;
	/* Initialize the library. Return a Window.g which represents the whole screen. */
	/* Note If there is an error opening the terminal, the underlying curses library may cause the interpreter to exit. */

	public static function is_term_resized(nlines:Int, ncols:Int):Bool;
	/* Return True if resize_term() would modify the window structure, False otherwise. */

	public static function isendwin():Bool;
	/* Return True if endwin() has been called (that is, the curses library has been deinitialized). */

	public static function keyname(k:Int):String;
	/* Return the name of the key numbered k. The name of a key generating printable ASCII character is the key’s character. The name of a control-key combination is a two-character string consisting of a caret followed by the corresponding printable ASCII character. The name of an alt-key combination (128-255) is a string consisting of the prefix ‘M-‘ followed by the name of the corresponding ASCII character. */

	public static function killchar():String;
	/* Return the user’s current line kill character. Under Unix operating systems this is a property of the controlling tty of the curses program, and is not set by the curses library itself. */

	public static function longname():String;
	/* Return a string containing the terminfo long name field describing the current terminal. The maximum length of a verbose description is 128 characters. It is defined only after the call to initscr(). */

	public static function meta(yes:Int):Void;
	/* If yes is 1, allow 8-bit characters to be input. If yes is 0, allow only 7-bit chars. */

	public static function mouseinterval(interval:Int):Void;
	/* Set the maximum time in milliseconds that can elapse between press and release events in order for them to be recognized as a click, and return the previous interval value. The default value is 200 msec, or one fifth of a second. */

	public static function mousemask(mousemask:Int):Tuple2<Int,Int>;
	/* Set the mouse events to be reported, and return a tuple (availmask, oldmask). availmask indicates which of the specified mouse events can be reported; on complete failure it returns 0. oldmask is the previous value of the given window’s mouse event mask. If this function is never called, no mouse events are ever reported. */

	public static function napms(ms:Int):Void;
	/* Sleep for ms milliseconds. */

	public static function newpad(nlines:Int, ncols:Int):Window.g;
	/* Create and return a pointer to a new pad data structure with the given number of lines and columns. A pad is returned as a window object. */

	/* A pad is like a window, except that it is not restricted by the screen size, and is not necessarily associated with a particular part of the screen. Pads can be used when a large window is needed, and only a part of the window will be on the screen at one time. Automatic refreshes of pads (such as from scrolling or echoing of input) do not occur. The refresh() and noutrefresh() methods of a pad require 6 arguments to specify the part of the pad to be displayed and the location on the screen to be used for the display. The arguments are pminrow, pmincol, sminrow, smincol, smaxrow, smaxcol; the p arguments refer to the upper left corner of the pad region to be displayed and the s arguments define a clipping box on the screen within which the pad region is to be displayed. */

	@:overload(function(nlines:Int, ncols:Int, begin_y:Int, begin_x:Int):Window.g)
	public static function newwin(nlines:Int, ncols:Int):Window.g;
	/* Return a new window, whose left-upper corner is at (begin_y, begin_x), and whose height/width is nlines/ncols. */
	/* By default, the window will extend from the specified position to the lower right corner of the screen. */

	public static function nl():Void;
	/* Enter newline mode. This mode translates the return key into newline on input, and translates newline into return and line-feed on output. Newline mode is initially on. */

	public static function nocbreak():Void;
	/* Leave cbreak mode. Return to normal “cooked” mode with line buffering. */

	public static function noecho():Void;
	/* Leave echo mode. Echoing of input characters is turned off. */

	public static function nonl():Void;
	/* Leave newline mode. Disable translation of return into newline on input, and disable low-level translation of newline into newline/return on output (but this does not change the behavior of addch('\n'), which always does the equivalent of return and line feed on the virtual screen). With translation off, curses can sometimes speed up vertical motion a little; also, it will be able to detect the return key on input. */

	public static function noqiflush():Void;
	/* When the noqiflush() routine is used, normal flush of input and output queues associated with the INTR, QUIT and SUSP characters will not be done. You may want to call noqiflush() in a signal handler if you want output to continue as though the interrupt had not occurred, after the handler exits. */

	public static function noraw():Void;
	/* Leave raw mode. Return to normal “cooked” mode with line buffering. */

	public static function pair_content(pair_number:Int):Tuple2<Int,Int>
	/* Return a tuple (fg, bg) containing the colors for the requested color pair. The value of pair_number must be between 1 and COLOR_PAIRS - 1. */

	public static function pair_number(attr:Int):Int;
	/* Return the number of the color-pair set by the attribute value attr. color_pair() is the counterpart to this function. */

	public static function putp(string:String)
	/* Equivalent to tputs(str, 1, putchar); emit the value of a specified terminfo capability for the current terminal. Note that the output of putp() always goes to standard output. */

	public static function qiflush([flag:Bool=True):Void;
	/* If flag is False, the effect is the same as calling noqiflush(). If flag is True, or no argument is provided, the queues will be flushed when these control characters are read. */

	public static function raw():Void;
	/* Enter raw mode. In raw mode, normal line buffering and processing of interrupt, quit, suspend, and flow control keys are turned off; characters are presented to curses input functions one by one. */

	public static function reset_prog_mode():Void;
	/* Restore the terminal to “program” mode, as previously saved by def_prog_mode(). */

	public static function reset_shell_mode():Void;
	/* Restore the terminal to “shell” mode, as previously saved by def_shell_mode(). */

	public static function resetty():Void;
	/* Restore the state of the terminal modes to what it was at the last call to savetty(). */

	public static function resize_term(nlines:Int, ncols:Int):Void;
	/* Backend function used by resizeterm(), performing most of the work; when resizing the windows, resize_term() blank-fills the areas that are extended. The calling application should fill in these areas with appropriate data. The resize_term() function attempts to resize all windows. However, due to the calling convention of pads, it is not possible to resize these without additional interaction with the application. */

	public static function resizeterm(nlines:Int, ncols:Int):Void;
	/* Resize the standard and current windows to the specified dimensions, and adjusts other bookkeeping data used by the curses library that record the window dimensions (in particular the SIGWINCH handler). */

	public static function savetty():Void;
	/* Save the current state of the terminal modes in a buffer, usable by resetty(). */

	public static function setsyx(y:Int, x:Int):Void;
	/* Set the virtual screen cursor to y, x. If y and x are both -1, then leaveok is set. */

	public static function setupterm(?termstr:String, ?fd:python.lib.FileObject):Void;
	/* Initialize the terminal. termstr is a string giving the terminal name; if omitted, the value of the TERM environment variable will be used. fd is the file descriptor to which any initialization sequences will be sent; if not supplied, the file descriptor for sys.stdout will be used. */

	public static function start_color():Void;
	/* Must be called if the programmer wants to use colors, and before any other color manipulation routine is called. It is good practice to call this routine right after initscr(). */

	/* start_color() initializes eight basic colors (black, red, green, yellow, blue, magenta, cyan, and white), and two global variables in the curses module, COLORS and COLOR_PAIRS, containing the maximum number of colors and color-pairs the terminal can support. It also restores the colors on the terminal to the values they had when the terminal was just turned on. */

	public static function termattrs():Int;
	/* Return a logical OR of all video attributes supported by the terminal. This information is useful when a curses program needs complete control over the appearance of the screen. */

	public static function termname():String;
	/* Return the value of the environment variable TERM, truncated to 14 characters. */

	public static function tigetflag(capname:String):Int;
	/* Return the value of the Boolean capability corresponding to the terminfo capability name capname. The value -1 is returned if capname is not a Boolean capability, or 0 if it is canceled or absent from the terminal description. */

	public static function tigetnum(capname:String):Int;
	/* Return the value of the numeric capability corresponding to the terminfo capability name capname. The value -2 is returned if capname is not a numeric capability, or -1 if it is canceled or absent from the terminal description. */

	public static function tigetstr(capname:String):String;
	/* Return the value of the string capability corresponding to the terminfo capability name capname. None is returned if capname is not a string capability, or is canceled or absent from the terminal description. */

	public static function tparm(str:String):Void;
	/* Instantiate the string str with the supplied parameters, where str should be a parameterized string obtained from the terminfo database. E.g. tparm(tigetstr("cup"), 5, 3) could result in b'\033[6;4H', the exact result depending on terminal type. */

	public static function typeahead(fd:python.lib.FileObject):Void;
	/* Specify that the file descriptor fd be used for typeahead checking. If fd is -1, then no typeahead checking is done. */

	/* The curses library does “line-breakout optimization” by looking for typeahead periodically while updating the screen. If input is found, and it is coming from a tty, the current update is postponed until refresh or doupdate is called again, allowing faster response to commands typed in advance. This function allows specifying a different file descriptor for typeahead checking. */

	public static function unctrl(ch:Int):String;
	/* Return a string which is a printable representation of the character ch. Control characters are displayed as a caret followed by the character, for example as ^C. Printing characters are left as they are. */

	public static function ungetch(ch:Int):Void;
	/* Push ch so the next getch() will return it. */
	/* Note Only one ch can be pushed before getch() is called. */

	public static function update_lines_cols():Void;
	/* Update LINES and COLS. Useful for detecting manual screen resize. */
	/* New in version 3.5. */

	public static function unget_wch(ch:Int):Void;
	/* Push ch so the next get_wch() will return it. */
	/* Note Only one ch can be pushed before get_wch() is called. */
	/* New in version 3.3. */

	public static function ungetmouse(id:Int, x:Int, y:Int, z:Int, bstate:Int):Void;
	/* Push a KEY_MOUSE event onto the input queue, associating the given state data with it. */

	public static function use_env(flag:Bool):Void;
	/* If used, this function should be called before initscr() or newterm are called. When flag is False, the values of lines and columns specified in the terminfo database will be used, even if environment variables LINES and COLUMNS (used by default) are set, or if curses is running in a window (in which case default behavior would be to use the window size if LINES and COLUMNS are not set). */

	public static function use_default_colors():Void;
	/* Allow use of default values for colors on terminals supporting this feature. Use this to support transparency in your application. The default color is assigned to the color number -1. After calling this function, init_pair(x, curses.COLOR_RED, -1) initializes, for instance, color pair x to a red foreground color on the default background. */

	public static function wrapper(func:Window.g->Array<Dynamic>->Void, xs:Array<Dynamic>):Void;
	/* Initialize curses and call another callable object, func, which should be the rest of your curses-using application. If the application raises an exception, this function will restore the terminal to a sane state before re-raising the exception and generating a traceback. The callable object func is then passed the main window ‘stdscr’ as its first argument, followed by any other arguments passed to wrapper(). Before calling func, wrapper() turns on cbreak mode, turns off echo, enables the terminal keypad, and initializes colors if the terminal has color support. On exit (whether normally or by exception) it restores cooked mode, turns on echo, and disables the terminal keypad. */
		
}
