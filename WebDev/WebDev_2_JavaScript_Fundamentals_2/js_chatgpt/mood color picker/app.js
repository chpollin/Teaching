let count = 0;
let customMoods = {};

function changeMoodColor() {
    const mood = document.getElementById('mood').value;
    let color;
    const hungry_color = '#C96115';

    switch (mood) {
        case 'happy':
            color = '#FFD700';
            break;
        case 'sad':
            color = '#4169E1';
            break;
        case 'energetic':
            color = '#FF4500';
            break;
        case 'calm':
            color = '#228B22';
            break;
        case 'hungry':
            color = hungry_color;
            break;
        default:
            color = customMoods[mood] || '#f0f0f0';
    }

    if (['happy', 'calm'].includes(mood)) {
        displayInfo(mood);
    }

    document.body.style.backgroundColor = color;
    /*
    console.log("Count ist " + count);
    console.log("count: " + typeof count);
    console.log("color: " + typeof color);
    console.log("mood: " + typeof mood);
    console.log("document.getElementById('mood'): " + typeof document.getElementById('mood'));
    */
    count++;
}

function displayInfo(mood) {
    document.getElementById('info').innerText = mood;
}

function addCustomMood() {
    const customMood = document.getElementById('customMood').value;
    const customColor = document.getElementById('customColor').value;

    if(isValidColor(customColor))
    {
        customMoods[customMood] = customColor;
        console.log(customMoods);
        alert(`Added custom mood: ${customMood} with color ${customColor}`);
    }
    else
    {
        alert("Please enter a valid color code.");
    }  
}

function isValidColor(color) {
    const regex = /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/;
    return regex.test(color);
}
