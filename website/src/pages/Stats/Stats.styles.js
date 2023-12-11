import styled from 'styled-components';
import { blue, green, red, yellow } from '../../styles/colors';

var borderTop = (color) => `
    border-left: 2px ${color} solid;
    border-right: 2px ${color} solid;
    border-top: 2px ${color} solid;
`;
var StatsStyles = styled.div`
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

            &:nth-child(even){
                top: -120px;
                display: none;
            }
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
        ${borderTop(blue)}
    }

    .stat-levelstars {
        width: 68px;
        margin-left: 21px;
        ${borderTop(yellow)}
    }

    .stat-daymeter {
        width: 64px;
        margin-left: 11px;
        ${borderTop(green)}
    }

    .stat-badge {
        width: 55px;
        margin-left: 6px;
        ${borderTop(red)}
    }

    .stat-exp {
        margin-left: 34px;
    }

    .stat-coins {
        margin-left: 46px;
        
    }

    .stat-totalstars {
        margin-left: 20px;
        
    }

    .stat-cherries {
        margin-left: 0;
    }

    .stat-item {
        margin-left: 45px;
    }
`;

export default StatsStyles;