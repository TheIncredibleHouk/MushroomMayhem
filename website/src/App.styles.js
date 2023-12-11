import { createGlobalStyle} from 'styled-components';


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
        border-top: #345084 24px solid;
        border-left: #345084 24px solid;
        position: relative;
        padding: 0 10px;
        padding-bottom: 15px;
        overflow-x: hidden;

        &::before {
            content: "t";
            font-size: 0;
            width: 24px;
            height: 24px;
            background-color: #ed786e;
            position: absolute;
            top: -24px;
            left: -24px;
        }
    }

    ul {
        margin: 15px;
        padding-left: 15px;
    }

    p {
        margin-bottom: 5px;
    }
    font-family: Arial, Helvetica, sans-serif;
`;

export default AppStyles;