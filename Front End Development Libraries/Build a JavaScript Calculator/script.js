const buttons = [
  { id: "clear", text: "AC", type: "clear" },
  { id: "divide", text: "/", type: "operator" },
  { id: "multiply", text: "*", type: "operator" },
  { id: "seven", text: "7", type: "number" },
  { id: "eight", text: "8", type: "number" },
  { id: "nine", text: "9", type: "number" },
  { id: "subtract", text: "-", type: "operator" },
  { id: "four", text: "4", type: "number" },
  { id: "five", text: "5", type: "number" },
  { id: "six", text: "6", type: "number" },
  { id: "add", text: "+", type: "operator" },
  { id: "one", text: "1", type: "number" },
  { id: "two", text: "2", type: "number" },
  { id: "three", text: "3", type: "number" },
  { id: "equals", text: "=", type: "equals" },
  { id: "zero", text: "0", type: "number" },
  { id: "decimal", text: ".", type: "decimal" }
];

function App() {
  const [expression, setExpression] = React.useState("0");
  const [current, setCurrent] = React.useState("0");
  const [evaluated, setEvaluated] = React.useState(false);

  const isOperator = /[+\-*/]/;

  const handleClick = (btn) => {
    const { text, type } = btn;

    if (type === "clear") {
      setExpression("0");
      setCurrent("0");
      setEvaluated(false);
    } 
    else if (type === "number") {
      if (evaluated) {
        setExpression(text);
        setCurrent(text);
        setEvaluated(false);
      } else {
        if (current === "0" || isOperator.test(current)) {
          setCurrent(text);
        } else {
          setCurrent(current + text);
        }

        if (expression === "0") {
          setExpression(text);
        } else {
          setExpression(expression + text);
        }
      }
    } 
    else if (type === "operator") {
      if (evaluated) {
        setExpression(current + text);
        setEvaluated(false);
      } else {
        let newExp = expression;
        if (/[+\-*/]$/.test(expression)) {
          if (text === "-" && !/-$/.test(expression)) {
            newExp += text;
          } else {
            newExp = newExp.replace(/[+\-*/]+$/, text);
          }
        } else {
          newExp += text;
        }
        setExpression(newExp);
      }
      setCurrent(text);
    } 
    else if (type === "decimal") {
      if (evaluated) {
        setExpression("0.");
        setCurrent("0.");
        setEvaluated(false);
      } else if (!current.includes(".")) {
        setCurrent(current + ".");
        setExpression(expression + ".");
      }
    } 
    else if (type === "equals") {
      let result = expression;
      while (/[+\-*/]$/.test(result)) {
        result = result.slice(0, -1);
      }
      const answer = eval(result);
      setCurrent(answer.toString());
      setExpression(result + "=" + answer);
      setEvaluated(true);
    }
  };

  return (
    <div id="calculator">
      <div id="display">{current}</div>
      <div className="keypad">
        {buttons.map((btn) => (
          <button
            key={btn.id}
            id={btn.id}
            className={`${btn.type}`}
            onClick={() => handleClick(btn)}
          >
            {btn.text}
          </button>
        ))}
      </div>
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById("root"));
