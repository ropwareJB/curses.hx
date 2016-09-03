package curses;

@:final class MouseMaskState{

	public var avail:Int;
	public var old:Int;

	public function new(avail:Int, old:Int){
		this.avail = avail;
		this.old = old;
	}
}
