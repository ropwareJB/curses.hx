package curses;

#if python
	typedef Window = curses.py.Window;
#else cpp
	typedef Window = cpp.Pointer<curses.cpp.Window>;
#end
