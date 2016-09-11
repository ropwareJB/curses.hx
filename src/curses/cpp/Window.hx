package curses.cpp;

import cpp.Pointer;

@:native("WINDOW")
@:include("curses.h") 
extern class CWindow{}

@:final abstract Window(Pointer<CWindow>) from Pointer<CWindow>{

	public function str(y:Int, x:Int, s:String, attr:Int):Void{
		curses.cpp.Curses.mvwaddstr(this, y, x, s);
	}

	public function refresh():Void{
		curses.cpp.Curses.wrefresh(this);
	}
	
}
