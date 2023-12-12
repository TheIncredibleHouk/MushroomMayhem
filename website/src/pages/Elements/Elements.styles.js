import styled from 'styled-components';

var ElementsStyles = styled.div`

    .elements-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        align-items: center;
        justify-content: center;
    }

    .box-layout {
        display: flex;
        flex-direction: row;
        align-items: center;
        height: 100px;

        .element-image {
            flex-basis: 96px;
            flex-grow: 0;
            flex-shrink: 0;

            img {
                width: 48px;
            }
        }
    }
`;

export default ElementsStyles;