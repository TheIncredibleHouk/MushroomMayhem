import styled from 'styled-components';

var NesPadMenuStyles = styled.div`
    display: grid;
    grid-template-columns: 1fr 1fr;
    width: 100%;
    height: 100%;
    justify-items: center;
    align-items: center;

    .start, .select {
        height: 20%;
        width: 90%;
        border-radius: 100px;
        background-color: grey;
    }

    .true {
        background-color: red;
    }
`;

export default NesPadMenuStyles;