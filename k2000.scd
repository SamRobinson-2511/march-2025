(
~k = MIDIOut(3);
~k.latency = 0;
)


(
Window.closeAll;
w = Window("Kurzweil Programmer", Rect(150, Window.screenBounds.height - 250, 250, 100)).front.alwaysOnTop_(true);
/*w.view.decorator = FlowLayout(w.view.bounds);*/

~adsr = EnvelopeView(w, Rect(360, 0, 230, 80))
.drawLines_(true)
.selectionColor_(Color.red)
.drawRects_(true)
.resize_(5)
.step_(0.05)
.value_([[0.0, 0.1, 0.5], [0.1, 0.8, 0.0]])
.action_({ ~cc73 })
.thumbSize_(5);

w.front;

~cc73 = ~k.control(0, 73, linlin(0, 1, 0, 127));
~cc72 = ~k.control(0, 72, linlin(0, 1, 0, 127));
~cc71 = ~k.control(0, 71, linlin(0, 1, 0, 127));
/*b.setEnv(Env.asr(0.5, 1, 0.2));*/
b.grid = Point(0.2, 0.2);
b.gridOn_(true);


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


(
MIDIClient.init;
m = MIDIOut(3); // Adjust to your MIDI device

// Envelope definition


// Synth that converts envelope to MIDI CC
SynthDef(\midiCCEnv, {
    var env = EnvGen.kr(Env.perc(0.1, 0.6, 1.0), doneAction: 2);
    var midiCC = (env * 127).clip(0, 127).round(1); // Scale to MIDI range
    SendReply.kr(Impulse.kr(20), '/envVal', midiCC); // Send data
}).add;
)

// Listen and send MIDI CC
(
OSCdef(\envToCC, { |msg|
    var ccValue = msg[3].asInteger;
    ~k1cc73 = m.control(0, 73, ccValue); // Sending to CC 1 on channel 0
}, '/envVal');
)

// Trigger the envelope
(
m.noteOn(0, 60, 127);
x = Synth(\midiCCEnv);
)

m.noteOff(0, 60);

Env.perc(0.1, 0.5, 1.0).plot;

















