import styled from 'styled-components';
import { shadow } from '../../styles/shadows';

var BoxStyles = styled.div`
    border: 2px solid black;
    border-radius: 10px;
    position: relative;
    width: 400px;
    max-width: 90vw;
    overflow: hidden;
    margin-bottom: 15px;
    ${shadow};

    h1 {
        background-color: ${props => props.color};
        color: #ffffff;
        font-size: 16px;
        text-align: center;
        padding: 4px;
        margin: 0;
        text-transform: uppercase;
    }

    .box-layout {
        padding: 10px;
        height: 100%;
    }
`;

export default BoxStyles;