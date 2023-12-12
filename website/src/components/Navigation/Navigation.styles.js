import styled from 'styled-components';
import { shadow } from '../../styles/shadows';

var NavigationStyles = styled.div`
    @keyframes open-animation {
        0%    { 
            width: 50px;
            height: 50px;
            border-radius: 25px
        }

        50% {
            width: 300px;
            height: 50px;
            border-radius: 17.5px
        }

        100%  { 
            width: 300px;
            height: 165px;
            border-radius: 10px
        }
    }

    @keyframes close-animation {
        0%    { 
            width: 300px;
            height: 165px;
            border-radius: 10px
        }

        50% {
            width: 300px;
            height: 50px;
            border-radius: 17.5px
        }

        100%  { 
            width: 50px;
            height: 50px;
            border-radius: 25px
        }
    }

    cursor: pointer;
    position: sticky;
    background-color: #404040;
    bottom: calc(0vh + 15px);
    align-items: center;
    justify-content: center;
    display: flex;
    left: 100%;
    border-radius: 25px;
    text-align: left;
    overflow: hidden;
    animation: close-animation .5s;
    ${shadow};

    nav {
        width: 100%;
        padding: 10px 0;
    }

    &:not(.open){
        width: 50px;
        height: 50px;

        nav {
            display: none;
        }
    }

    a:link, a:visited, a:hover, a:active {
        text-decoration: none;
        color: #ffffff;
        width: 100%;
        padding: 12px 12px;
        font-size: 16px;
        display: block;
    }

    a:hover {
        background-color: #808080;
    }

    nav > li:last-child {
        border-top: 1px solid #ffffff;
    }

    &.open {
        animation: open-animation .5s;
        width: 300px;
        border-radius: 10px;

        .navigation-icon {
            display: none;
        }

        nav {
            list-style: none;
        }
    }

    .navigation-icon {
        .navigation-icon-bar {
            background-color: white;
            border-radius: 10px;
            width: 30px;
            height: 3px;
            margin: 5px 0;
        }
    }
`;

export default NavigationStyles;