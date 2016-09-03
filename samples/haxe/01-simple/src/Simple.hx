package;

import curses.Curses;
import curses.Window;

class Simple{

	public static function main(){
		var stdscr:Window = Curses.initScreen();
		Curses.noEcho();
		Curses.cbreak();

		Curses.startColor();
		Curses.useDefaultColors();
		for(i in 0...Curses.COLORS)
			Curses.initPair(0, 0, -1);

		stdscr.addstr(10, 30, "Simple example :)", Curses.colorPair(0));
		stdscr.refresh();

		while(true){}
	}

}
