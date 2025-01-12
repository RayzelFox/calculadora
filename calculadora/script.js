function clearDisplay() {
    document.getElementById('display').textContent = '0';
}

function appendToDisplay(value) {
    const display = document.getElementById('display');
    if (display.textContent === '0') {
        display.textContent = value;
    } else {
        display.textContent += value;
    }
}

function calculateResult() {
    const display = document.getElementById('display');
    try {
        display.textContent = eval(display.textContent.replace('x', '*'));
    } catch (e) {
        display.textContent = 'Erro';
    }
}
