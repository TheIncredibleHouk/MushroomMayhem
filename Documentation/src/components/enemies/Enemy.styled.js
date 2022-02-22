import styled from 'styled-components';

const EnemyStyles = styled.div`
    border: 5px solid #d82800;
    border-radius: 5px;
    border-top: 0;
    break-inside: avoid;
    display: inline-block;
    margin: 20px;
    position: relative;
    width: 418px;

    .enemy-info {
        display: flex;
    }

    .enemy-name {
        background-color: #d82800;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        color: #FFFFFF;
        font-weight: bold;
        font-size: 20px;
        left: -5px;
        padding-bottom: 5px;
        padding-left: 10px;
        padding-top: 5px;
        position: relative;
        width: calc(100% + 10px);
        z-index: 2;
    }

    .enemy-description {
        font-size: 16px;
        padding-left: 10px;
        padding-top: 5px;
    }

    .enemy-icon {
        height: 192px;
    }

    .health-stats {
        display: flex;
        flex-wrap: wrap;
        width: 45%;
    }

    .enemy-health {
        background-color: #d82800;
        display: flex;
        padding-top: 4px;

        .fire-health, .ice-health, .hammer-health, .shuriken-health {
            background-color: #3cbcfc;
            border-radius: 5px;
            margin: 2px;
            padding: 2px;
            overflow: hidden;
        }
    }

    .stats {
        align-items: center center;
        display: flex;
        padding-top: 12px;
        width: 55%;

        img {
            background-color: #000000;
            border-radius: 5px;
            padding: 2px;
            margin-right: 10px;
            overflow: hidden;
        }
    }

    .grey {
        filter: grayscale(100%);
        opacity: .25;
    }
`;

export default EnemyStyles;