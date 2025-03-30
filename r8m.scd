(
~r8 = MIDIOut(5);
~r8.latency = 0;
/*~r8.noteOn(9, 69, 127)*/
// ~r8.noteOn(1, 38, 127);
)



(
var notes = (35..93);
var window = Window("R8M channel 10", Rect(100, 100, 600, 400)).front;
var layout = VLayout( *notes.collect {
	|nn|
	Button(w, Rect(0, 0, 3, 3))
	.string_(nn.asString)
	.action_({~r8.noteOn(9, nn, 127)})
});
window.layout = layout;
)



