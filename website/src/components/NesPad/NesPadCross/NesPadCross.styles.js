import styled from 'styled-components';

var NesPadCrossStyles = styled.div`
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    

    &.inline {
        width: 20px;
        height: 20px;
        position: relative;
        top: -8px;
        right: -2px;
        margin-bottom: -20px;
    }

    .nes-pad-cross-layout {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        width: 80%;
        height: 80%;
    }
    

    .up, .down, .left, .right, .center {
        background-color: gray;

        &.true {
            background-color: red;
        }
    }
`;

export default NesPadCrossStyles;