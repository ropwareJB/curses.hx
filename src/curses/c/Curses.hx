package curses.c;

@:native("")
@:cppFileCode("#include <curses.h>") 
@:buildXml('<compilerflag value="-lncurses"/>')
@:final extern class Curses{
	
	static public function initscr():Window;

	static public function mvaddstr(y:Int,x:Int,str:String):Void;

	static public function refresh():Void;

	static public function delwin(w:Window):Void;
	static public function endwin():Void;

}
