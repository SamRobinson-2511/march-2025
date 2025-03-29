(
m = MIDIOut(3);
d = MIDIOut(5);
)

(
d.latency = 0;
m.latency = 0;
)

(
Pdef(
	\studio, (
		~d1 = Pbind(
			\type, \midi,
			\midcmd, \noteOn,
			\midiout, d,
			\chan, 9,
			\midinote, Prand([30, 44, 67], inf),
			\amp, 5,
			\sustain, 0.04,
			\dur, 0.2,
			\stretch, 4*60/170,
		).play( quant: 4*60/170);

		~d2 = Pbind(
			\type, \midi,
			\midicmd, \noteOn,
			\midiout, d,
			\chan, 1,
			\midinote, Pseq([46, 58, 69, 74, 77, 84].scramble.reverse, inf),
			\amp, 5,
			\sustain, 0.4,
			\dur, 0.2,
			\stretch, 2*60/170,
		).play( quant: 2*60/170);

		~d3 = Pbind(
			\type, \midi,
			\midicmd, \noteOn,
			\midiout, d,
			\chan, 2,
			\midinote, Prand([38, 50, 72, 77, 81]+12, inf),
			\amp, 5,
			\sustain, 0.4,
			\dur, 0.2,
			\stretch, 2*60/170,
		).play( quant: 2*60/170);

		~d4 = Pbind(
			\type, \midi,
			\midicmd, \noteOn,
			\midiout, d,
			\chan, 3,
			\midinote, Prand([38, 50, 72, 77, 81]+12, inf),
			\amp, 5,
			\sustain, 0.4,
			\dur, 0.2,
			\stretch, 2*60/170,
		).play( quant: 2*60/170);

		~k1 = Pbind(
			\type, \midi,
			\midicmd, \noteOn,
			\midiout, m,
			\chan, 0,
			\midinote, Pwrand([62, 65, 74]-24, [0.5, 0.25, 0.25], inf),
			\amp, Pexprand(80, 127, inf)/127,
			\sustain, Pwhite(0.2, 0.25, inf),
			\dur, Pwrand([0.15, 0.10, 0.7], [0.5, 0.25, 0.25], inf),
			\stretch, 1*60/170
		).play(quant: 1*60/170);

		~k1_cc20= Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 0,
			\ctlNum, 20,
			\control, Pwhite(0, 127, inf).trace,
/*			\dur, Prand([0.15, 0.25, 0.5], inf),*/
			\stretch, 4*60/170
		).play(quant: 4*60/170);

		~k2 = Pbind(
			\type, \midi,
			\midicmd, \noteOn,
			\midiout, m,
			\chan, 1,
			\midinote, Pxrand([
				[38, 50, 72, 77, 81],
				[43, 55, 70, 77, 79],
				[46, 58, 69, 74, 77, 84]
			]+12, inf),
			\amp, Pwhite(15, 30, inf),
			\sustain, Pexprand(4, 8, inf),
			\dur, Prand([4, 6, 8], inf),
			\stretch, 4*60/170
		).play(quant: 4*60/170);

		~k2_cc20 = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 1,
			\ctlNum, 20,
			\control, Pseq([0, 12, 24, 48, 72, 96, 120].reverse.scramble, inf),
			\dur, 0.15,
			\stretch, 16*60/170
		).play(quant: 16*60/170);

		~rev500_predelay = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 12,
			\control, Pseq([0, 12, 24, 48, 72, 96, 120].reverse.scramble, inf),
			\dur, 0.15,
			\stretch, 16*60/170
		).play(quant: 16*60/170);

		~rev500_revtime = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 13,
			\control, Pwhite(0, 127, inf),
			\dur, 0.15,
			\stretch, 8*60/170
		).play(quant: 2*60/170);

		~rev500_hiratio = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 14,
			\control, Pwhite(0, 127, inf),
			\dur, 0.15,
			\stretch, 16*60/170
		).play(quant: 16*60/170);

		~rev500_erlevel = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 15,
			\control, Pseq([0, 12, 24, 48, 72, 96, 120], inf),
			\dur, 0.15,
			\stretch, 32*60/170
		).play(quant: 32*60/170);

		~rev500_efflevel = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 16,
			\control, Pseq([48, 72, 96, 120].reverse, inf),
			\dur, 0.20,
			\stretch, 8*60/170
		).play(quant: 4*60/170);

		~rev500_loratio = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 17,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 2*60/170
		).play(quant: 2*60/170);

		~rev500_diffusion = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 18,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 4*60/170
		).play(quant: 4*60/170);

		~rev500_hpf = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 19,
			\control, Pwhite(0, 64, inf),
			\dur, 0.20,
			\stretch, 8*60/170
		).play(quant: 4*60/170);

		~rev500_lpf = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 20,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);

		~rev500_gatelevel = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 24,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);



		~rev500_hold = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 25,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);


		~rev500_decay = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 26,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);


		~rev500_detect = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 27,
			\control, Prand([0, 127], inf),
			\dur, 0.20,
			\stretch, 2*60/170
		).play(quant: 4*60/170);


		~rev500_sens = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 70,
			\control, Pwhite(0,10, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);

		~rev500_offset = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 71,
			\control, Pseq([0, 12, 24, 48, 64].reverse, inf),
			\dur, 0.20,
			\stretch, 4*60/170
		).play(quant: 4*60/170);

		~rev500_resonance = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 72,
			\control, Pseq([0, 12, 24, 48, 60, 72, 127].reverse, inf),
			\dur, 0.20,
			\stretch, 2*60/170
		).play(quant: 2*60/170);

		~rev500_decay = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 73,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);

		~rev500_speedC = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 74,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);

		~rev500_depthC = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 75,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);

		~rev500_mixC = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 77,
			\control, Pwhite(0, 127, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);





		~rev500_speed = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 78,
			\control, Pseq([0, 12, 24, 48, 60, 72, 127].reverse, inf),
			\dur, 0.20,
			\stretch, 16*60/170
		).play(quant: 4*60/170);

		~rev500_depth = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 79,
			\control, Pseq([0, 24, 48, 72].reverse, inf),
			\dur, 0.20,
			\stretch, 8*60/170
		).play(quant: 4*60/170);

		~rev500_phase = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 80,
			\control, Pseq([ 0, 1, 2, 3] * 20, inf),
			\dur, 0.20,
			\stretch, 8*60/170
		).play(quant: 4*60/170);

		~rev500_wave = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 81,
			\control, Prand([0, 65, 127], inf),
			\dur, 0.20,
			\stretch, 8*60/170
		).play(quant: 4*60/170);

		~rev500_feedback = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 82,
			\control, Pseq([0, 127].reverse, inf),
			\dur, 0.20,
			\stretch, 8*60/170
		).play(quant: 4*60/170);

		~rev500_crossfeedback = Pbind(
			\type, \midi,
			\midicmd, \control,
			\midiout, m,
			\chan, 15,
			\ctlNum, 83,
			\control, Pseq([0, 64,127].scramble, inf),
			\dur, 0.20,
			\stretch, 8*60/170
		).play(quant: 4*60/170);
	)
)
)
)

~rev500_pgm = m.program(15, 150);

(
~rev500_cc12.stop;
~rev500_cc13.stop;
~k1.stop;
~k1.mute;
~k1.unmute;
~k2.stop;
~k2.mute;
)