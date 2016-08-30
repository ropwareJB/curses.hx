package;

import curses.cpp.Curses;
import curses.cpp.Window;
import cpp.Pointer;

class Simple{

	public static function main(){
		var stdscr:Pointer<Window> = Curses.initscr();

		Curses.mvaddstr(13, 33, "This is a test :)");
		Curses.refresh();
		
		while(true){}
	}

}
