package;

import curses.py.Curses;
import curses.py.Window;

class Simple{

	public static function main(){
		var stdscr:Window = Curses.initscr();
		Curses.noecho();
		Curses.cbreak();

		Curses.start_color();
		Curses.use_default_colors();
		for(i in 0...Curses.COLORS)
			Curses.init_pair(i, i, -1);

		stdscr.addstr(10, 30, "Simple example :)", Curses.color_pair(0));
		stdscr.refresh();

		while(true){}
	}

}
