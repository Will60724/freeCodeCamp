const defaultMarkdown = `# Welcome to my Markdown Previewer!

## This is a sub-heading...

[I'm a link](https://www.freecodecamp.org)

Inline code: \`console.log("Hello, world!")\`

\`\`\`
// Code block
function greet(name) {
  return \`Hello, \${name}!\`;
}
\`\`\`

- List item 1
- List item 2
- List item 3

> Blockquote time!

**Bold text**

![Image](https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png)
`;

marked.setOptions({
  breaks: true // Enable line breaks
});

function App() {
  const [markdown, setMarkdown] = React.useState(defaultMarkdown);

  const handleChange = (e) => {
    setMarkdown(e.target.value);
  };

  return (
    <div id="app">
      <textarea
        id="editor"
        value={markdown}
        onChange={handleChange}
      />
      <div
        id="preview"
        dangerouslySetInnerHTML={{
          __html: marked.parse(markdown)
        }}
      />
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById("root"));
