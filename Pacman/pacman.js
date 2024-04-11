const pacman = document.createElement('div');
pacman.classList.add('pacman');
pacman.classList.add('left');

const mouth = document.createElement('div');
mouth.classList.add('mouth');
pacman.appendChild(mouth);

document.body.appendChild(pacman);

document.addEventListener('keydown', (e) => {
    switch(e.keyCode){
        case 37:
            pacman.className = `pacman left`;
            break;

        case 38:
            pacman.className = `pacman up`;
            break;

        case 39:
            pacman.className = `pacman right`;
            break;            

        case 40:
            pacman.className = `pacman down`;
            break;
    }
})