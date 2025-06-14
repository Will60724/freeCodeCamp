const userInput = document.getElementById("user-input");
const output = document.getElementById("results-div");
const checkBtn = document.getElementById("check-btn");
const clearBtn = document.getElementById("clear-btn");

const checkUserInput = (input) => {
  input = userInput.value.trim();
  if (input === "") {
    alert("Please provide a phone number");
    return;
  }

  const countryCode = "(1\\s?)?"; // Optional "1" and optional space
  const areaCode = "(\\(\\d{3}\\)|\\d{3})"; // Area code in (555) or 555
  const separator = "[\\s-]?"; // Optional space or hyphen
  const phoneNumber = "\\d{3}[\\s-]?\\d{4}"; // 555-5555 with optional separator

  const regex = new RegExp(`^${countryCode}${areaCode}${separator}${phoneNumber}$`);

  const pTag = document.createElement("p");
  pTag.className = "results-text";
  pTag.textContent =  `${regex.test(input) ? 'Valid' : 'Invalid'} US number: ${input}`;
  output.appendChild(pTag);
};


const clearOutput = () => {
  output.textContent = "";
  userInput.value = "";
};


checkBtn.addEventListener("click", ()=>{
  checkUserInput(userInput);
  userInput.value = ""; // Clear input after checking
});

clearBtn.addEventListener("click", clearOutput);

userInput.addEventListener("keydown", (e) => {
  if (e.key === "Enter") {
    checkUserInput(userInput);
    userInput.value = ""; // Clear input after checking
  }
});