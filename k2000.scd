(
~k = MIDIOut(3);
~k.latency = 0;
)


(
Window.closeAll;
w = Window("Kurzweil Programmer").front.alwaysOnTop_(true);


~modWheel = Slider(w, Rect(20, 20, 30, 150))
.orientation_(\vertical)
.background_(Color(0.2, 0.75, 0.95))
.action_({
	|obj|
	var mod;
	mod = obj.value.linlin(0, 1, 0, 127 ).postln;
	~k.control(0, 1, mod)
});


~portTime = Knob(w, Rect(60, 60, 20, 20))
.background_(Color(0.2, 0.7, 0.95))
.action_({
	|obj|
	var port;
	port = obj.value.linlin(0, 1, 0, 127).postln;
	~k.control(0, 5, port)
});

~portSwitch = Button(w, Rect(60, 20, 20, 20))
.states_([
	["off", Color.black, Color.gray(0.8)],
	["on", Color.white, Color(0.2, 0.75, 0.95)]
])
.background_(Color(0.2, 0.7, 0.95))
.action_({
	|obj|
	if (obj.value == 1, {
		~k.control(0, 65, 127)
	}, {
		~k.control(0, 65, 0)
	}
	)
});

~freeze = Button(w, Rect(60, 100, 20, 20))
.states_([
	["off", Color.black, Color.gray(0.8)],
	["on", Color.white, Color(0.2, 0.75, 0.95)]
])
.background_(Color(0.2, 0.7, 0.95))
.action_({
	|obj|
	if (obj.value == 1, {
		~k.control(0, 69, 127)
	}, {
		~k.control(0, 69, 0)
	}
	)
});



~volume = Slider(w, Rect(100, 20, 30, 150))
.orientation_(\vertical)
.background_(Color(0.2, 0.75, 0.95))
.action_({
	|obj|
	var vol;
	vol = obj.value.linlin(0, 1, 0, 127 ).postln;
	~k.control(0, 7, vol)
});

~balance = Slider(w, Rect(160, 20, 150, 30))
.orientation_(\horizontal)
.background_(Color(0.2, 0.75, 0.95))
.action_({
	|obj|
	var bal;
	bal = obj.value.linlin(0, 1, 0, 127 ).postln;
	~k.control(0, 8, bal)
});

~pan = Slider(w, Rect(160, 60, 150, 30))
.orientation_(\horizontal)
.background_(Color(0.2, 0.75, 0.95))
.action_({
	|obj|
	var pan;
	pan = obj.value.linlin(0, 1, 0, 127 ).postln;
	~k.control(0, 10, pan)
});



)