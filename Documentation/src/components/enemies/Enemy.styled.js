import styled from 'styled-components';

const EnemyStyles = styled.div`
    border: 5px solid #d82800;
    border-radius: 5px;
    border-top: 0;
    display: inline-block;
    height: 230px;
    margin: 20px;
    position: relative;
    width: 418px;

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
        padding-right: 140px;
        padding-top: 5px;
    }

    .enemy-icon {
        bottom: 0;
        height: 192px;
        overflow: hidden;
        position: absolute;
        right: 0px;
    }
`;

export default EnemyStyles;