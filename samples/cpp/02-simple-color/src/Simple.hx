package;

import curses.cpp.Curses;
import curses.cpp.Window;
import cpp.Pointer;

class Simple{

	public static function main(){
		var stdscr:Pointer<Window> = Curses.initscr();
		Curses.start_color();

		Curses.init_pair(1, COLOR_RED, COLOR_WHITE);
		Curses.bkgd(Curses.color_pair(1));
		Curses.color_set(1, Nothing);

		Curses.mvaddstr(13, 33, "This is a test (with colour!) :)");
		Curses.refresh();
		
		while(true){}
	}

}
