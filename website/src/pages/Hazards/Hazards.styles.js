import styled from 'styled-components';
import { mobile } from '../../styles/mobile';

var HazardsStyles = styled.div`
    
    .hazards-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        align-items: center;
        grid-gap: 15px;
    }

    .hazard-layout {
        display: flex;
        flex-direction: row;
        align-items: center;

        img {
            width: 128px;
            margin-right: 25px;
        }
    }

    .box {
        width: 100%;
    }

    @media screen and (max-width: ${mobile}){     
        .hazards-layout {
            grid-template-columns: 1fr;
        }
    }
`;

export default HazardsStyles;