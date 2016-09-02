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

		Curses.mvaddstr(13, 33, "The symbol on the left below is made via mvadd_wch!");
		Curses.mvadd_wch(15, 40, WACS_DDDD);
		
		var pp:Array<CHType> = [ACS_LEQUAL];
		var p:ConstPointer<CHType> = NativeArray.address(pp,0);
		Curses.mvaddchstr(15, 44, p);

		Curses.mvaddstr(18, 33, "The symbol on the right is made with mvaddchstr!");

		Curses.refresh();
		
		while(true){}
	}

}
