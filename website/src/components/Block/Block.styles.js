import styled from 'styled-components';

var BlockStyles = styled.div`
    border: ${props => props.boltSize}px solid #000000;
    background: linear-gradient(160deg, white, ${props => props.color}, black) border-box;
    position: relative;
    padding: ${props => props.boltSize}px;

    .bolt_1, .bolt_2, .bolt_3, .bolt_4 {
        height: ${props => props.boltSize}px;
        width: ${props => props.boltSize}px;
        background-color: #000000;
        display: block;
        position: absolute;
        margin: ${props => props.boltSize*2}px;
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
    }

    .block-layout {
        background-color: ${props => props.color};
        padding: ${props => props.boltSize*3}px;
    }
`;

export default BlockStyles;