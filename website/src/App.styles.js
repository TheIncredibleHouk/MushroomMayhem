import styled, { createGlobalStyle } from "styled-components";
import { mobile } from "./styles/mobile";

var AppStyles = createGlobalStyle`
   @font-face {
        font-family:new super mario font u;
        font-style:normal;
        font-weight:400;
        src:local('New Super Mario Font U'), url('https://fonts.cdnfonts.com/s/32226/New Super Mario Font U.woff') format('woff');
    }

    @font-face{
        font-family:KabelHeavy;
        font-style:normal;
        font-weight:400;
        src:local('OPTIKabel-Heavy'), url('./fonts/OPTIKabel-Heavy.woff') format('woff');
    }

    @font-face{
        font-family:'BabyTeeth';
        font-style:normal;
        font-weight:400;
        src:local('Baby Teeth'), url('./fonts/Devandra.ttf') format('truetype');
    }

    * {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }

   html {
        background-color: #404040;
    }

    body {
        margin: 0 auto;
        max-width: 9.5in;
        background-color: #ffffff;
        border-top: #345084 32px solid;
        border-left: #345084 32px solid;
        padding: 0 10px;
        padding-bottom: 50px;
        overflow-x: hidden;
        position: relative;

        &::before {
            content: "t";
            font-size: 0;
            width: 32px;
            height: 32px;
            background-color: #eb4638;
            position: absolute;
            top: -32px;
            left: -32px;
        }
    }

    ul {
        margin: 15px;
        padding-left: 15px;
    }

    p {
        margin-bottom: 5px;
    }

    .social-media {
        position: absolute;
        right: 0;
        top: -30px;
        display: flex;
        flex-direction: row;
        
        img {
            width: 28px;
            margin: 0 10px;
            filter: invert(100%) sepia(100%) saturate(0%) hue-rotate(125deg) brightness(103%) contrast(103%);
        }
    }

    font-family: Arial, Helvetica, sans-serif;
`;

var PageStyles = styled.div`

  @media screen and (max-width: ${mobile}) {
    & > div {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .social-media {
        flex-direction: row;
    }
  }
`;

export { PageStyles };

export default AppStyles;
