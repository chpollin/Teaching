function add() {
    const number1 = parseFloat(document.getElementById('number1').value);
    const number2 = parseFloat(document.getElementById('number2').value);
    const result = number1 + number2;
    displayResult(result);
}

function subtract() {
    const number1 = parseFloat(document.getElementById('number1').value);
    const number2 = parseFloat(document.getElementById('number2').value);
    const result = number1 - number2;
    displayResult(result);
}

function multiply() {
    const number1 = parseFloat(document.getElementById('number1').value);
    const number2 = parseFloat(document.getElementById('number2').value);
    const result = number1 * number2;
    displayResult(result);
}

function divide() {
    const number1 = parseFloat(document.getElementById('number1').value);
    const number2 = parseFloat(document.getElementById('number2').value);
    if (number2 !== 0) {
        const result = number1 / number2;
        displayResult(result);
    } else {
        displayResult('Cannot divide by 0');
    }
}

function displayResult(result) {
    document.getElementById('result').textContent = `Result: ${result}`;
}
