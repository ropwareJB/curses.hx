package;

import curses.cpp.Curses;
import curses.cpp.Window;
import cpp.Pointer;

class Simple{

	public static function main(){
		var stdscr:Pointer<Window> = Curses.initscr();
		Curses.start_color();

		Curses.init_pair(1, COLOR_YELLOW, COLOR_RED);

		untyped __cpp__("color_set(1, 0)");

		Curses.mvaddstr(13, 33, "This is a test (with colour!) :)");
		Curses.refresh();
		
		while(true){}
	}

}
