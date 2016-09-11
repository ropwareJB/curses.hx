package curses;

#if python
	typedef Window = curses.py.Window;
#elseif cpp
	typedef Window = curses.cpp.Window;
#end
