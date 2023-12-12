import styled from 'styled-components';
import { blue, green, red, yellow } from '../../styles/colors';
import { shadow } from '../../styles/shadows';
import { blockStyle } from '../../styles/block';
import { mobile } from '../../styles/mobile';



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

    .block {
        ${shadow};
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
        padding-left: 8px;
        word-spacing: 15px;
        text-align: center;
        
        ${() => Array.apply(null, new Array(colors.length)).map((nothing, index) => (
            `.letter_${index} {
                color: ${colors[index]};
                margin-left: -8px;
            }`
        )).join('\n')}

        .kern-fix {
            margin-right: 6px;
        }
    }

    .break {
        display: block;
    }

    &.center {
        flex-direction: column;
        width: 100%;
        align-items: center;
        white-space: normal;
        
        .page-title {
            margin-left: 0px;
        }

        .page-description {
            width: 90%;
            padding: 15px;
        }

        .letter_0 { 
            font-size: 72px;
        }
    }

    @media screen and (max-width: ${mobile}) {
        flex-direction: column;
        width: 100%;
        align-items: center;

        .page-title {
            margin-left: 0px;
            font-size: 50px;
        }
        
        .page-description {
            padding: 0;
            width: 90%;
        }
    }

`;

export default PageTitleStyles;