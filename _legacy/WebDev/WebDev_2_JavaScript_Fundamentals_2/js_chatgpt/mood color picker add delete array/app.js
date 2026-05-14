let count = 0;
let customMoods = [];

function changeMoodColor() {
    const mood = document.getElementById('mood').value;
    let color;
    const hungry_color = '#C96115';
    
    const customMood = customMoods.find(({ name }) => name === mood);

    if (customMood) {
        color = customMood.color;
    } else {
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
                color = '#f0f0f0';
        }
    }

    count++;

    if (mood == "happy" || mood == "calm") {
        displayInfo(mood);
    }
    
    document.body.style.backgroundColor = color;
}

function displayInfo(mood) {
    document.getElementById('info').innerText = mood;
}

function addCustomMood() {
    const customMood = document.getElementById('customMood').value;
    const customColor = document.getElementById('customColor').value;

    if (customMood && customColor) {
        customMoods.push({ name: customMood, color: customColor });
        updateMoodList();
    }
}

function removeCustomMood() {
    const customMood = document.getElementById('customMood').value;

    const index = customMoods.findIndex(({ name }) => name === customMood);

    if (index !== -1) {
        customMoods.splice(index, 1);
        updateMoodList();
    } else {
        alert('Custom mood not found');
    }
}

function updateMoodList() {
    const moodSelect = document.getElementById('mood');
    const customMoodOptions = moodSelect.querySelectorAll('.custom-mood');

    customMoodOptions.forEach(option => {
        moodSelect.removeChild(option);
    });

    customMoods.forEach(({ name }) => {
        const newOption = document.createElement('option');
        newOption.value = name;
        newOption.innerText = name;
        newOption.classList.add('custom-mood');
        moodSelect.appendChild(newOption);
    });
}
