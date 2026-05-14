function changeMoodColor() {
    const mood = document.getElementById('mood').value;
    let color;

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
        default:
            color = '#f0f0f0';
    }

    document.body.style.backgroundColor = color;
}
