import styled from 'styled-components';

const PowerUpStyles = styled.div`
    border-left: 5px solid #5fa0ff;
    border-bottom: 5px solid #5fa0ff;
    border-radius: 5px;
    height: 165px;
    margin: 20px;
    position: relative;
    width: 878px;

    .powerup-name {
        background-color: #5fa0ff;
        border-top-right-radius: 5px;
        color: #ffffff;
        font-weight: bold;
        font-size: 20px;
        padding-bottom: 5px;
        padding-left: 60px;
        padding-top: 5px;
    }
    .powerup-description {
        padding-left: 20px;
        padding-right: 150px;
        padding-top: 5px;
        text-indent: 40px;
    }

    .powerup-icon {
        background-color: #5fa0ff;
        border-radius: 5px 30px 30px 30px;
        display: inline-block;
        padding: 10px;
        position: absolute;
        left: -5px;
        top: 0;
    }

    .powerup-mario {
        background-color: #3cbcfc;
        border-radius: 75px 0px 5px 75px;
        bottom: -5px;
        display: inline-block;
        overflow: hidden;
        position: absolute;
        right: 0;
    }
`;

export default PowerUpStyles;