import styled from 'styled-components';

var NesPadStyles = styled.div`
    align-items: center;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    justify-items: center;
    border: 1px solid black;
    height: ${props => props.zoom * 100}px;
    width: ${props => props.zoom * 300}px;
`;

export default NesPadStyles;