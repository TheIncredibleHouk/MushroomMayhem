import styled from 'styled-components';
import { shadow } from '../../styles/shadows';

var PowerUpStyles = styled.div`
    display: inline-grid;
    grid-template-columns: 1fr 1fr;
    row-gap: 25px;
    width: 100%;
    justify-content: space-evenly;
    justify-items: center;
    align-content: space-evenly;
    align-items: center;

    .power-up-box {
        border: 2px solid black;
        border-radius: 10px;
        box-shadow: 0 0 0;
        position: relative;
        height: 400px;
        width: 400px;
        overflow: hidden;
        box-shadow: ${shadow};
    }

    .power-up-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        justify-content: space-evenly;
        justify-items: center;
        height: calc(100% - 25px);
        padding: 10px;
    }

    .power-up-image {
        position: absolute;
        left: 0;
        top: 0;
        background-color: #629bd9;
        padding: 8px;
        border-radius: 32px;

        img {
            width: 32px;
        }
    }

    .power-up-screenshot {
        max-width: 256px;
        height: 172px;
        width: calc(100% - 20px);
        overflow: hidden;
        display: inline-block;
        margin: 10px;
        align-self: end;
    }

    .power-up-mario {
        margin: 8px;
        align-self: center;

        img {
            height: 64px;
        }
    }

    h1 {
        background-color: #4d9dde;
        color: #ffffff;
        font-size: 16px;
        text-align: center;
        padding: 4px;
        margin: 0;
        text-transform: uppercase;
    }

    @media screen and (max-width: 1024px) {
        grid-template-columns: 1fr;
        justify-items: center;

        .power-up-box {
            width: 100%;
            max-width: 400px;
        }
    }
`;

export default PowerUpStyles;