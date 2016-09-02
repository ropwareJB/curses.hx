package;

import curses.cpp.Curses;
import curses.cpp.Window;
import cpp.ConstPointer;
import cpp.NativeArray;
import cpp.Pointer;

class Simple{

	public static function main(){
		var stdscr:Pointer<Window> = Curses.initscr();
		Curses.start_color();

		Curses.init_pair(1, COLOR_RED, COLOR_WHITE);
		Curses.bkgd(Curses.color_pair(1));
		Curses.color_set(1, Nothing);

		Curses.refresh();
		var w = Curses.newwin(4, 40, 12, 30);
		Curses.box(w, 0, 0);
		var s = "Windows and borders :D";
		Curses.mvwaddstr(w, 2, 2, s);
		Curses.wrefresh(w);
		
		while(true){}
	}

}
