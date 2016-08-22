package curses;

@:native("curses.textpad")
@:final extern class Rectangle{

	public static function rectangle(win:Window, uly:Int, ulx:Int, lry:Int, lrx:Int):Void;
	/* Draw a rectangle. The first argument must be a window object; the remaining arguments are coordinates relative to that window. The second and third arguments are the y and x coordinates of the upper left hand corner of the rectangle to be drawn; the fourth and fifth arguments are the y and x coordinates of the lower right hand corner. The rectangle will be drawn using VT100/IBM PC forms characters on terminals that make this possible (including xterm and most other software terminal emulators). Otherwise it will be drawn with ASCII dashes, vertical bars, and plus signs. */

}

@:enum abstract KEYSTROKE(Int) to Int{
	var NUL     = 0x00;// ^@
	var SOH     = 0x01;// ^A
	var STX     = 0x02;// ^B
	var ETX     = 0x03;// ^C
	var EOT     = 0x04;// ^D
	var ENQ     = 0x05;// ^E
	var ACK     = 0x06;// ^F
	var BEL     = 0x07;// ^G
	var BS      = 0x08;// ^H
	var TAB     = 0x09;// ^I
	var HT      = 0x09;// ^I
	var LF      = 0x0a;// ^J
	var NL      = 0x0a;// ^J
	var VT      = 0x0b;// ^K
	var FF      = 0x0c;// ^L
	var CR      = 0x0d;// ^M
	var SO      = 0x0e;// ^N
	var SI      = 0x0f;// ^O
	var DLE     = 0x10;// ^P
	var DC1     = 0x11;// ^Q
	var DC2     = 0x12;// ^R
	var DC3     = 0x13;// ^S
	var DC4     = 0x14;// ^T
	var NAK     = 0x15;// ^U
	var SYN     = 0x16;// ^V
	var ETB     = 0x17;// ^W
	var CAN     = 0x18;// ^X
	var EM      = 0x19;// ^Y
	var SUB     = 0x1a;// ^Z
	var ESC     = 0x1b;// ^[
	var FS      = 0x1c;// ^\
	var GS      = 0x1d;// ^]
	var RS      = 0x1e;// ^^
	var US      = 0x1f;// ^_
	var SP      = 0x20;// space
	var DEL     = 0x7f;// delete
}


@:native("curses.textpad.Textbox")
@:final extern class Textbox{

	public function new(win:Window);
	/* Return a textbox widget object. The win argument should be a curses WindowObject in which the textbox is to be contained. The edit cursor of the textbox is initially located at the upper left hand corner of the containing window, with coordinates (0, 0). The instance’s stripspaces flag is initially on. */

	public function edit(?validator:Int->Int):String;
	/* This is the entry point you will normally use. It accepts editing keystrokes until one of the termination keystrokes is entered. If validator is supplied, it must be a function. It will be called for each keystroke entered with the keystroke as a parameter; command dispatch is done on the result. This method returns the window contents as a string; whether blanks in the window are included is affected by the stripspaces attribute.*/

	public function do_command(ch:KEYSTROKE):Void;
	/* Process a single command keystroke. Here are the supported special keystrokes:*/

	public function gather():String;
	/* Return the window contents as a string; whether blanks in the window are included is affected by the stripspaces member.*/

	public var stripspaces:Bool;
	/* This attribute is a flag which controls the interpretation of blanks in the window. When it is on, trailing blanks on each line are ignored; any cursor motion that would land the cursor on a trailing blank goes to the end of that line instead, and trailing blanks are stripped when the window contents are gathered. */

}
