const quotes = [
  {
    text: "Be yourself; everyone else is already taken.",
    author: "Oscar Wilde"
  },
  {
    text: "So many books, so little time.",
    author: "Frank Zappa"
  },
  {
    text: "A room without books is like a body without a soul.",
    author: "Marcus Tullius Cicero"
  },
  {
    text: "Be the change that you wish to see in the world.",
    author: "Mahatma Gandhi"
  },
  {
    text: "If you tell the truth, you don't have to remember anything.",
    author: "Mark Twain"
  }
];

function getRandomQuote() {
  return quotes[Math.floor(Math.random() * quotes.length)];
}

function App() {
  const [quote, setQuote] = React.useState(getRandomQuote());

  const handleNewQuote = () => {
    setQuote(getRandomQuote());
  };

  return (
    <div className="app-container">
      <div id="quote-box">
        <p id="text">"{quote.text}"</p>
        <p id="author">- {quote.author}</p>

        <div className="buttons">
          <a
            id="tweet-quote"
            href={`https://twitter.com/intent/tweet?text=${encodeURIComponent(
              `"${quote.text}" - ${quote.author}`
            )}`}
            target="_blank"
            rel="noopener noreferrer"
          >
            Tweet
          </a>
          <button id="new-quote" onClick={handleNewQuote}>
            New Quote
          </button>
        </div>
      </div>
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById("root"));
