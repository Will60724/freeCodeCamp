const numberInput = document.getElementById("number");
const convertBtn = document.getElementById("convert-btn");
const output = document.getElementById("output");
const resetBtn = document.getElementById("reset-btn");

const checkUserInput = () => {
  const inputInt = parseInt(numberInput.value);
  let errmsg = "";

  if (!numberInput.value || isNaN(inputInt)) {
    //alert("Please enter a valid number");
    errmsg = "Please enter a valid number";
  }else if (inputInt < 1) {
    //alert("Please enter a number greater than or equal to 1");
    errmsg = "Please enter a number greater than or equal to 1";
  }else if (inputInt >= 4000) {
    //alert("Please enter a number less than or equal to 3999");
    errmsg = "Please enter a number less than or equal to 3999";
  }

  if (errmsg) {
    output.textContent = errmsg;
    output.classList.remove("hidden");
  } else {
    const roman = convertToRoman(inputInt);
    output.textContent = roman;
    output.classList.remove("hidden");
  }

};

const convertToRoman = (input) => {
  const ref = [
    {M:1000},
    {CM: 900},
    {D: 500},
    {CD: 400},
    {C: 100},
    {XC: 90},
    {L: 50},
    {XL: 40},
    {X: 10},
    {IX: 9},
    {V: 5},
    {IV: 4},
    {I: 1}
  ];
  if (input === 0) return "";
  for (let i = 0; i < ref.length; i++) {
    const key = Object.keys(ref[i])[0];
    const value = ref[i][key];
    if (input >= value) {
      return key + convertToRoman(input - value); // recursion
    }
  }
};

const resetOutput = () => {
  output.textContent = "";
  output.classList.add("hidden");
  numberInput.value = "";
};


convertBtn.addEventListener("click", checkUserInput);

resetBtn.addEventListener("click", resetOutput);

numberInput.addEventListener("keydown", (e) => {
  if (e.key === "Enter") {
    checkUserInput();
  }
});