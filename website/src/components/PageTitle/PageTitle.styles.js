import styled from 'styled-components';
import { blue, green, red, yellow } from '../../styles/colors';
import { shadow } from '../../styles/shadows';
import { blockStyle } from '../../styles/block';



const colors = [
    red, blue, yellow, green, red, green, yellow, blue, green, yellow, blue, red, green,
    red, blue, yellow, green, red, green, yellow, blue, green, yellow, blue, red, green,
    red, blue, yellow, green, red, green, yellow, blue, green, yellow, blue, red, green,
];

var PageTitleStyles = styled.div`
    display: flex;
    justify-content: space-between;
    align-items: start;
    margin-bottom: 15px;
    margin-left: -10px;

    .page-description {
        width: 45%;
        margin-right: -10px;
        padding: 15px;
    }

    .page-title {
        font-family: 'New Super Mario Font U', sans-serif;
        display: inline-block;
        clear: both;
        text-transform: uppercase;
        text-shadow: 6px 6px 0px #000000;
        padding: 2px;
        font-size: 72px;
        line-height: 80px;
        -webkit-text-stroke: 4px #000000;
        white-space: nowrap;
        padding-top: 8px;
        padding-right: 8px;
        
        ${() => Array.apply(null, new Array(colors.length)).map((nothing, index) => (
            `.letter_${index} {
                color: ${colors[index]};
                margin-left: -8px;
            }`
        )).join('\n')}

    

        .letter_0 {
            font-size: 128px;
            margin-left: 8px;
        }

    }

    @media screen and (max-width: 1024px) {
        flex-direction: column;
        width: 100%;
        align-items: center;

        .page-title {
            margin-left: 0px;
        }
        
        .page-description {
            padding: 0;
            width: 90%
        }
    }

    @media screen and (max-width: 500px) {
        .page-title {

        }
    }
`;

export default PageTitleStyles;