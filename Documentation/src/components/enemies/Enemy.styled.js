import styled from 'styled-components';

const EnemyStyles = styled.div`
    border: 5px solid #000000;
    border-radius: 5px;
    border-top: 0;
    display: inline-block;
    height: 405px;
    margin: 20px;
    position: relative;
    width: 266px;

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
        margin-bottom: -33px;
        position: relative;
        width: calc(100% + 10px);
    }

    .enemy-description {
        font-size: 16px;
        padding-left: 5px;
        padding-right: 5px;
        padding-top: 5px;
        text-indent: 10px;
    }

    .enemy-icon {
        background-color: #FFFFFF;
        border-radius: 40px 5px 40px 40px;
        display: inline-block;
        height: 56px;
        overflow: hidden;
        padding: 10px;
        padding-left: 12px;
        padding-top: 12px;
        position: absolute;
        right: -5px;
        top: 0;
        width: 56px;
    }

    .enemy-mario {
        display: inline-block;
    }
`;

export default EnemyStyles;