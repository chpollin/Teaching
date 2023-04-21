let count = 0;

function changeMoodColor() {
    const mood = document.getElementById('mood').value;
    let color;
    const hungry_color = '#C96115';
    

    switch (mood) {
        case 'happy':
            color = '#FFD700';
            count++;
            break;
        case 'sad':
            color = '#4169E1';
            count++;
            break;
        case 'energetic':
            color = '#FF4500';
            count++;
            break;
        case 'calm':
            color = '#228B22';
            count++;
            break;
        case 'hungry':
		    color = hungry_color;
            count++;
		    break;
        default:
            color = '#f0f0f0';
    }

    if(mood == "happy" || mood == "calm")
    {
        displayInfo(mood);
    }
    
    document.body.style.backgroundColor = color;
    console.log("Count ist " + count);
    console.log("count: " + typeof count);
    console.log("color: " + typeof color);
    console.log("mood: " + typeof mood);
    console.log("document.getElementById('mood'): " + typeof document.getElementById('mood'));
}


function displayInfo(mood) {
    document.getElementById('info').innerText = mood;
}


