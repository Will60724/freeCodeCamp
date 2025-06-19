const pads = [
  { key: "Q", name: "Heater 1", url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-1.mp3" },
  { key: "W", name: "Heater 2", url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-2.mp3" },
  { key: "E", name: "Heater 3", url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-3.mp3" },
  { key: "A", name: "Heater 4", url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-4_1.mp3" },
  { key: "S", name: "Clap", url: "https://s3.amazonaws.com/freecodecamp/drums/Heater-6.mp3" },
  { key: "D", name: "Open-HH", url: "https://s3.amazonaws.com/freecodecamp/drums/Dsc_Oh.mp3" },
  { key: "Z", name: "Kick-n'-Hat", url: "https://s3.amazonaws.com/freecodecamp/drums/Kick_n_Hat.mp3" },
  { key: "X", name: "Kick", url: "https://s3.amazonaws.com/freecodecamp/drums/RP4_KICK_1.mp3" },
  { key: "C", name: "Closed-HH", url: "https://s3.amazonaws.com/freecodecamp/drums/Cev_H2.mp3" }
];

function DrumPad({ pad, playSound }) {
  const handleClick = () => {
    playSound(pad.key);
  };

  return (
    <button
      className="drum-pad"
      id={pad.name}
      onClick={handleClick}
    >
      {pad.key}
      <audio
        className="clip"
        id={pad.key}
        src={pad.url}
      />
    </button>
  );
}

function App() {
  const [display, setDisplay] = React.useState("");

  const playSound = (key) => {
    const audio = document.getElementById(key);
    if (audio) {
      audio.currentTime = 0;
      audio.play();
      const pad = pads.find(p => p.key === key);
      setDisplay(pad ? pad.name : "");
    }
  };

  React.useEffect(() => {
    const handleKeyDown = (e) => {
      const key = e.key.toUpperCase();
      if (pads.some(p => p.key === key)) {
        playSound(key);
      }
    };
    document.addEventListener("keydown", handleKeyDown);
    return () => document.removeEventListener("keydown", handleKeyDown);
  }, []);

  return (
    <div id="drum-machine">
      <div id="display">{display}</div>
      <div className="pad-grid">
        {pads.map(pad => (
          <DrumPad key={pad.key} pad={pad} playSound={playSound} />
        ))}
      </div>
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById("root"));
