import styled from 'styled-components';
import { mobile } from '../../styles/mobile';

var TechniquesStyles = styled.div`
    .techniques-screenshots {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        margin: 25px;

        img { 
            margin: 0 15px;
        }
    }

    .right-arrow {
        width: 112px;
        height: 56px;
    }

    @media screen and (max-width: ${mobile}){
        .techniques-screenshots {
            flex-direction: column;
        }

        .right-arrow {
            transform: rotate(90deg);
        }
    }
`

export default TechniquesStyles;