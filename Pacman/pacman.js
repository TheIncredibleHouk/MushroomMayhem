const pacman = document.createElement('div');
pacman.classList.add('pacman');
pacman.classList.add('left');

const mouth = document.createElement('div');
mouth.classList.add('mouth');
pacman.appendChild(mouth);

document.addEventListener('keydown', e => game.keyHeld = e.keyCode);
document.addEventListener('keyup', e => game.keyHeld = 0);

const mazeMap = {
    " ": 0,
    "H": 1,
    "*": 2,
    "O": 3
};

const tileTypes = {
    space: 0,
    wall: 1,
    pellete: 2,
    powerPellete: 3
}

const mazeClasses = {
    0: "space",
    1: "wall",
    2: "pellet",
    3: "power"
};

const maze = (`
HHHHHHHHHHHHHH
H************H
H*HHHH*HHHHH*H
HOHHHH*HHHHH*H
H*************
H*HHHH*HH*HHHH
H*HHHH*HH*HHHH
H******HH****H
HHHHHH*HHHHH H
     H*HHHHH H
     H*HH     
     H*HH HHHH
HHHHHH*HH H   
      *   H   
HHHHHH*HH H   
     H*HH HHHH
     H*HH     
     H*HH HHHH
HHHHHH*HH HHHH
H************H
H*HHHH*HHHHH*H
H*HHHH*HHHHH*H
HO*********** 
HHH*HH*HH*HHHH
HHH*HH*HH*HHHH
H******HH****H
H*HHHHHHHHHH*H
H*HHHHHHHHHH*H
H*************
HHHHHHHHHHHHHH
`);

const mazeData = [];
const mazeDivs = []

const setupMazeData = () => {
    const mazeLines = maze.split("\n");

    for (let i = 1, l = mazeLines.length - 1; i < l; i++) {
        const mazeBlocks = mazeLines[i].split("");
        mazeData.push(...mazeBlocks.map(block => mazeMap[block]));
        mazeData.push(...mazeBlocks.reverse().map(block => mazeMap[block]));
    }
}

const MAZE_COLUMNS = 28;
const MAZE_ROWS = 31;
const TILE_SIZE = 8;
const GAME_RESOLUTION_X = MAZE_COLUMNS * TILE_SIZE;
const GAME_RESOLUTION_Y = MAZE_ROWS * TILE_SIZE;
const PACMAN_START_X = (GAME_RESOLUTION_X / 2) - TILE_SIZE;
const PACMAN_START_Y = 23 * TILE_SIZE;
const DIRECTIONS = {
    left: 0,
    right: 1,
    up: 2,
    down: 3
};

const game = {
    player: {
        x: PACMAN_START_X,
        y: PACMAN_START_Y,
        direction: DIRECTIONS.right,
        bounds: {
            left: tileTypes.space,
            right: tileTypes.space,
            top: tileTypes.space,
            bottom: tileTypes.space,
            center: tileTypes.space
        }
    },
    paused: false,
    keyHeld: 0
};

let mazeBoard;
const drawMaze = () => {
    mazeBoard = document.createElement("div");
    mazeBoard.className = "maze";

    for (let c = 0; c < MAZE_ROWS; c++) {
        const mazeRow = document.createElement("div");

        for (let r = 0; r < MAZE_COLUMNS; r++) {
            const mazeColumn = document.createElement("div");
            mazeColumn.className = mazeClasses[mazeData[c * MAZE_COLUMNS + r]];

            mazeRow.appendChild(mazeColumn);
            mazeDivs.push(mazeColumn);
        }

        mazeBoard.appendChild(mazeRow);
    }
    const spacerLeft = document.createElement("div");
    const spacerRight = document.createElement("div");
    spacerLeft.className = spacerRight.classList = "spacer";

    document.body.appendChild(spacerLeft);
    document.body.appendChild(mazeBoard);
    document.body.appendChild(spacerRight);

    mazeBoard.appendChild(pacman);
}

const drawPlayer = () => {
    pacman.style.left = `${(game.player.x / GAME_RESOLUTION_X) * 100}%`;
    pacman.style.top = `${(game.player.y / GAME_RESOLUTION_Y) * 100}%`;
}

const movePlayer = () => {
    switch (game.player.direction) {
        case DIRECTIONS.left:
            pacman.className = "pacman left";
            game.player.x--;
            break;

        case DIRECTIONS.right:
            pacman.classList = "pacman right";
            game.player.x++;
            break;

        case DIRECTIONS.up:
            pacman.className = "pacman up";
            game.player.y--;
            break;

        case DIRECTIONS.down:
            pacman.classList = "pacman down";
            game.player.y++;
            break;
    }

    if (game.player.x <= -16) {
        game.player.x = GAME_RESOLUTION_X;
    } else if (game.player.x >= GAME_RESOLUTION_X) {
        game.player.x = -16;
    }
}

const playerInteractWithTiles = () => {
    if (game.player.bounds.left === tileTypes.wall) {
        game.player.x = parseInt((game.player.x + 8) / 8) * 8;
    }

    if (game.player.bounds.right === tileTypes.wall) {
        game.player.x = parseInt(game.player.x / 8) * 8;
    }

    if (game.player.bounds.top === tileTypes.wall) {
        game.player.y = parseInt((game.player.y + 8) / 8) * 8;
    }

    if (game.player.bounds.bottom === tileTypes.wall) {
        game.player.y = parseInt(game.player.y / 8) * 8;
    }
}

const playerDetectTiles = () => {
    game.player.bounds.left = getTile(game.player.x - 1, game.player.y + 8);
    game.player.bounds.right = getTile(game.player.x + 17, game.player.y + 8);
    game.player.bounds.top = getTile(game.player.x + 8, game.player.y - 1);
    game.player.bounds.down = getTile(game.player.x + 8, game.player.y + 17);
    game.player.bounds.center = getTile(game.player.x + 8, game.player.y + 8);
}

const getTile = (x, y) => {
    const tileCol = parseInt(x / TILE_SIZE);
    const tileRow = parseInt(y / TILE_SIZE);

    return mazeData[(tileRow * MAZE_COLUMNS) + tileCol];
}

const highlightPlayerTiles = () => {
    highlightTile(game.player.x - 1, game.player.y + 8);
    highlightTile(game.player.x + 17, game.player.y + 8);
    highlightTile(game.player.x + 8, game.player.y - 1);
    highlightTile(game.player.x + 8, game.player.y + 17);
    highlightTile(game.player.x + 8, game.player.y + 8);
}

const highlightTile = (x, y) => {
    const tileCol = parseInt(x / TILE_SIZE);
    const tileRow = parseInt(y / TILE_SIZE);

    return mazeDivs[(tileRow * MAZE_COLUMNS) + tileCol].classList.add("highlight");
}

const FRAMES_PER_SECOND = 60;

const gameLoop = () => {
    setTimeout(gameLoop, 1000 / FRAMES_PER_SECOND);

    handleControls();

    if (!game.paused) {
        movePlayer();
        playerDetectTiles();
        playerInteractWithTiles();
        drawPlayer();
    }

    document.title = `X: ${game.player.x} Y: ${game.player.y}`;
}

const handleControls = () => {
    switch (game.keyHeld) {
        case 37:
            game.player.direction = DIRECTIONS.left;
            break;

        case 38:
            game.player.direction = DIRECTIONS.up;
            break;

        case 39:
            game.player.direction = DIRECTIONS.right;
            break;

        case 40:
            game.player.direction = DIRECTIONS.down;
            break;

        case 13:
            game.paused = !game.paused;
            break;
    }
}

setupMazeData();
drawMaze();
gameLoop();