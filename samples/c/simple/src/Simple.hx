package;

import curses.c.Curses;
import curses.c.Window;

class Simple{

	public static function main(){
		var stdscr:Window = Curses.initscr();
		Curses.mvaddstr(13, 33, "This is a test :)");
		Curses.refresh();
		
		while(true){}

		Curses.delwin(stdscr);
		Curses.endwin();
		Curses.refresh();
	}

}
