import styled from 'styled-components';

var CollectiblesStyles = styled.div`

    .collectibles-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        align-items: center;
        justify-content: center;
    }

    .box-layout {
        display: flex;
        flex-direction: row;
        align-items: center;

        img {
            width: 48px;
            margin-right: 16px;
        }
    }
`;

export default CollectiblesStyles;