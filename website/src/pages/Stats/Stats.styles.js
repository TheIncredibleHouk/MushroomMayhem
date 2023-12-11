import styled from 'styled-components';
import { blue, green, red, yellow } from '../../styles/colors';
import { mobile } from '../../styles/mobile';
import { shadow } from '../../styles/shadows';

var borderTop = (color, high) => `
    border-left: 2px ${color} solid;
    border-right: 2px ${color} solid;
    border-top: 2px ${color} solid;

    &:before {
        content: "F";
        font-size: 0;
        width: 2px;
        height: ${ high ? '500%' : '200%'};
        background-color: ${color};
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        top: -${ high ? '500%' : '200%'};
    }
`;

var borderBottom = (color, high) => `
    border-left: 2px ${color} solid;
    border-right: 2px ${color} solid;
    border-bottom: 2px ${color} solid;

    &:before {
        content: "F";
        font-size: 0;
        width: 2px;
        height: ${ high ? '600%' : '300%'};
        background-color: ${color};
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        top: 24px;
    }
`;
var StatsStyles = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;

    .stats-explanation {
        margin-top: 175px;
        margin-bottom: 195px;
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;

        .stat-image {
            overflow-y: hidden;
            height: 58px;
            img {   
                height: 96px;
            }
        }

        .stats {
            display: flex;
            align-items: flex-end;
            justify-content: flex-start;
            justify-items: flex-start;
            color: #000000;
            width: 544px;
            font-weight: bold;
        }

        .stats-top {
            & > div {
                height: 24px;
                position: relative;
            }

            .block {
                position: absolute;
                top: -80px;
                left: 50%;
                transform: translateX(-50%);
                white-space: nowrap;
                color: #ffffff;
            }
        }

        .stats-top div:nth-child(even){
            .block{
                top: -150px;
            }
        }

        .stats-bottom {
            & > div {
                height: 24px;
                position: relative;
            }

            .block {
                position: absolute;
                top: 80px;
                left: 50%;
                transform: translateX(-50%);
                white-space: nowrap;
                color: #ffffff;
            }
        }

        .stats-bottom div:nth-child(even){
            .block{
                top: 150px;
            }
        }

        .stats-bottom{
            align-items: flex-start;
        }

        .stat-pmeter {
            margin-left: 4px;
            width: 140px;
            ${borderTop(red)}
        }

        .stat-airmeter {
            width: 108px;
            margin-left: 9px;
            ${borderTop(blue, true)}
        }

        .stat-levelstars {
            width: 68px;
            margin-left: 21px;
            ${borderTop(yellow)}
        }

        .stat-daymeter {
            width: 64px;
            margin-left: 11px;
            ${borderTop(green, true)}
        }

        .stat-badge {
            width: 55px;
            margin-left: 6px;
            ${borderTop(red)}
        }

        .stat-exp {
            margin-left: 4px;
            width: 140px;
            ${borderBottom(red)}
        }

        .stat-coins {
            width: 108px;
            margin-left: 9px;
            ${borderBottom(blue, true)}
        }

        .stat-totalstars {
            width: 68px;
            margin-left: 21px;
            ${borderBottom(yellow)}
        }

        .stat-cherries {
            width: 64px;
            margin-left: 9px;
            ${borderBottom(green, true)}
        }

        .stat-item {
            width: 55px;
            margin-left: 64px;
            ${borderBottom(red)}
        }
    }

    .stats-descriptions {
        display: grid;
        grid-template-columns: 1fr 1fr;
        width: 100%;
        gap: 15px;
        padding: 15px;

        .stat-description {
            border: 2px solid black;
            border-radius: 10px;
            overflow: hidden;
            ${shadow};

            h1 {
                color: #ffffff;
                font-size: 16px;
                text-align: center;
                padding: 4px;
                margin: 0;
                text-transform: uppercase;
            }
        }

        .stat-description-text {
            padding: 10px;
        }
    }

    @media screen and (max-width: ${mobile}) {
        .stats-descriptions {
            grid-template-columns: 1fr;
        }
    }
`;

export default StatsStyles;