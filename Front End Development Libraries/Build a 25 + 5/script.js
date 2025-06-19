const { useState, useEffect, useRef } = React;

function App() {
  const [breakLength, setBreakLength] = useState(5);
  const [sessionLength, setSessionLength] = useState(25);
  const [timeLeft, setTimeLeft] = useState(25 * 60);
  const [timerLabel, setTimerLabel] = useState("Session");
  const [isRunning, setIsRunning] = useState(false);
  const intervalRef = useRef(null);
  const beepRef = useRef(null);

  useEffect(() => {
    if (timeLeft === 0) {
      // Play sound at 00:00
      const audio = beepRef.current;
      audio.currentTime = 0;
      audio.play();

      setTimeout(() => {
        if (timerLabel === "Session") {
          setTimerLabel("Break");
          setTimeLeft(breakLength * 60);
        } else {
          setTimerLabel("Session");
          setTimeLeft(sessionLength * 60);
        }
      }, 1000); // Delay switch to give time for 00:00 display
    }
  }, [timeLeft]);

  useEffect(() => {
    if (isRunning) {
      intervalRef.current = setInterval(() => {
        setTimeLeft((prev) => Math.max(prev - 1, 0));
      }, 1000);
    } else {
      clearInterval(intervalRef.current);
    }

    return () => clearInterval(intervalRef.current);
  }, [isRunning]);

  const formatTime = (secs) => {
    const m = Math.floor(secs / 60).toString().padStart(2, "0");
    const s = (secs % 60).toString().padStart(2, "0");
    return `${m}:${s}`;
  };

  const handleReset = () => {
    clearInterval(intervalRef.current);
    setIsRunning(false);
    setBreakLength(5);
    setSessionLength(25);
    setTimeLeft(25 * 60);
    setTimerLabel("Session");
    const audio = beepRef.current;
    audio.pause();
    audio.currentTime = 0;
  };

  const handleStartStop = () => {
    setIsRunning((prev) => !prev);
  };

  const handleIncrement = (type) => {
    if (isRunning) return;

    if (type === "break" && breakLength < 60) {
      const newBreak = breakLength + 1;
      setBreakLength(newBreak);
      if (timerLabel === "Break") setTimeLeft(newBreak * 60);
    }

    if (type === "session" && sessionLength < 60) {
      const newSession = sessionLength + 1;
      setSessionLength(newSession);
      if (timerLabel === "Session") setTimeLeft(newSession * 60);
    }
  };

  const handleDecrement = (type) => {
    if (isRunning) return;

    if (type === "break" && breakLength > 1) {
      const newBreak = breakLength - 1;
      setBreakLength(newBreak);
      if (timerLabel === "Break") setTimeLeft(newBreak * 60);
    }

    if (type === "session" && sessionLength > 1) {
      const newSession = sessionLength - 1;
      setSessionLength(newSession);
      if (timerLabel === "Session") setTimeLeft(newSession * 60);
    }
  };

  return (
    <div id="clock">
      <h1>25 + 5 Clock</h1>

      <div className="length-control">
        <div>
          <h3 id="break-label">Break Length</h3>
          <button id="break-decrement" onClick={() => handleDecrement("break")}>-</button>
          <span id="break-length">{breakLength}</span>
          <button id="break-increment" onClick={() => handleIncrement("break")}>+</button>
        </div>

        <div>
          <h3 id="session-label">Session Length</h3>
          <button id="session-decrement" onClick={() => handleDecrement("session")}>-</button>
          <span id="session-length">{sessionLength}</span>
          <button id="session-increment" onClick={() => handleIncrement("session")}>+</button>
        </div>
      </div>

      <div id="timer">
        <h2 id="timer-label">{timerLabel}</h2>
        <div id="time-left">{formatTime(timeLeft)}</div>
      </div>

      <button id="start_stop" onClick={handleStartStop}>
        {isRunning ? "Pause" : "Start"}
      </button>
      <button id="reset" onClick={handleReset}>Reset</button>

      <audio
        id="beep"
        ref={beepRef}
        preload="auto"
        src="https://actions.google.com/sounds/v1/alarms/alarm_clock.ogg"
      />
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById("root"));
