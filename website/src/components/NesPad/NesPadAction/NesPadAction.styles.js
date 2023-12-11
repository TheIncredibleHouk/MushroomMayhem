import styled from 'styled-components';

var NesPadActionStyles = styled.div`

    width: 100%;
    height: 100%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 0;

    &.inline {
        width: 40px;
        height: 40px;
        position: relative;
        color: white;
        font-size: 12px;
        font-weight: bold;
        text-align: center;
        margin-bottom: -32px;
        position: relative;
        top: 0px;
        left: -2px;
        margin-top: -40px;
        line-height: 15px;
    }

    .nes-pad-action-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        justify-items: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }

    .B, .A {
        background-color: grey;
        width: 80%;
        height: calc(80% / 2);
        border-radius: 100px;

        &.true {
            background-color: red;
        }
    }
`;

export default NesPadActionStyles;