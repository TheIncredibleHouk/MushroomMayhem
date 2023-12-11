const blockStyle = (color, boltSize) => {
    return `
    border: ${boltSize/2}px solid #000000;
    background: linear-gradient(160deg, white, ${color}, black) border-box;

    .bolt_1, .bolt_2, .bolt_3, .bolt_4 {
        height: ${boltSize}px;
        width: ${boltSize}px;
        background-color: #000000;
        display: block;
        position: absolute;
        margin: ${boltSize/2}px;
    }

    .bolt_1 {
        left: 0;
        top: 0;
    }

    .bolt_2 {
        top: 0;
        right: 0;
    }

    .bolt_3 {
        left: 0;
        bottom: 0;
    }

    .bolt_4 {
        right: 0;
        bottom: 0;
    }`
};

export { blockStyle };