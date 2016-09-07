package curses;

#if python
	typedef Window = curses.py.Window;
#elseif cpp
	typedef Window = cpp.Pointer<curses.cpp.Window>;
#end
