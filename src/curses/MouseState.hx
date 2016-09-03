package curses;

@:final class MouseState{

	public var id:Int;
	public var x:Int;
	public var y:Int;
	public var z:Int;
	public var bstate:Int;

	public function new(id:Int, x:Int, y:Int, z:Int, bstate:Int){
		this.id = id;
		this.x = x;
		this.y = y;
		this.z = z;
		this.bstate = bstate;
	}

}
