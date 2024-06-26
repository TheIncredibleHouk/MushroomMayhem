import styled from 'styled-components';
import { mobile } from '../../styles/mobile';

var ElementsStyles = styled.div`

    .elements-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        align-items: center;
        justify-content: center;
        justify-items: center;
        align-content: center;
        margin-bottom: 50px;
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

    @media screen and (max-width: ${mobile}){
        .elements-layout {
            grid-template-columns: 1fr;
        }       
    }
`;

export default ElementsStyles;