import styled from 'styled-components';
import { blue } from '../../styles/colors';
import { mobile } from '../../styles/mobile';

var HomeStyles = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;

    .home-description {
        margin: 50px auto;

        a:link, a:visited, a:hover, a:active {
            color: blue;
            font-weight: bold;
        }
    }


    .title-3 {
        max-width: 200px;
    }

    .home-table-contents {
        width: 95%;
    }

    h1 {
        text-align: center;
        padding-bottom: 25px;
        margin-bottom: 25px;
        border-bottom: 2px solid #808080;
        font-size: 48px;
    }

    .home-table-contents {
        border: 2px solid #808080;
        padding: 25px;
        margin-top: 25px;
        font-family: KabelHeavy;

      
    }

    .home-table-contents-list {
        display: flex;
        width: 100%;
        font-size: 36px;
        font-weight: bold;
        white-space: nowrap;
        align-items: center;
        margin-top: 25px;

        div:nth-child(2){
            width: 100%;
            border-top: 4px dotted black;
            height: 2px;
            margin: 5px;
            margin-top: 10px;
            overflow: hidden;
        }
    }

    a:link, a:visited, a:hover, a:active {
        color: black;
        text-decoration: none;
    }

    @media screen and (max-width: ${mobile}){
        .home-table-contents-list  {
            font-size: 24px;
        }
    }
`;

export default HomeStyles;