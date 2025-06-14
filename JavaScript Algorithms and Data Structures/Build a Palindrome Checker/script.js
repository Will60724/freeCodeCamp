const userInput = document.getElementById('text-input');
const checkButton = document.getElementById('check-btn');
const result = document.getElementById('result');

function checkPalindrome(input) {
    const text = input;
    if (text === '') {
        alert('Please input a value');
        return;
    }

    const cleanedText = text.toLowerCase().replace(/[^a-z0-9]/g, '');
    const reversedText = cleanedText.split('').reverse().join('');

    if (cleanedText === reversedText) {
        result.textContent = `${text} is a palindrome.`;
    } else {
        result.textContent = `${text} is not a palindrome.`;
    }

    result.classList.remove('hidden');
}

checkButton.addEventListener('click', () => {
    const inputText = userInput.value;
    checkPalindrome(inputText);
}
);

userInput.addEventListener('keydown', (event) => {
    if (event.key === 'Enter') {
        const inputText = userInput.value;
        checkPalindrome(inputText);
    }
});
