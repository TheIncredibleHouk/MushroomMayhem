import styled from 'styled-components';

var NesPadActionStyles = styled.div`

    width: 100%;
    height: 100%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 120%;
    font-weight: bold;
    text-align: center;
    color: #ffffff;
    line-height: 15px;

    &.inline {
        width: 15px;
        height: 40px;
        position: relative;
        color: white;
        font-size: 12px;
        margin-bottom: -32px;
        margin-top: -40px;
        line-height: 15px;
        text-align: center;
        position: relative;
        top: -1px;

        .B, .A {
            width: 15px;
            padding-top: 5%;
            display: none;

            &.true {
                display: block;
            }
        }
    }

        &:not(.inline)
        {
            .B, .A {
                border: 1px solid white;
            }
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
        background-color: black;
        width: 80%;
        height: calc(80% / 2);
        border-radius: 100px;
        padding-top: 15%;

        &.true {
            background-color: red;
        }
    }
`;

export default NesPadActionStyles;