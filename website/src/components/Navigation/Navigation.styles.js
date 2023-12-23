import styled from 'styled-components';
import { shadow } from '../../styles/shadows';

var NavigationStyles = styled.div`
    @keyframes open-animation {
        0%    { 
            width: 50px;
            height: 50px;
            border-radius: 25px
        }

        100%  { 
            width: 300px;
            height: 471px;
            border-radius: 10px
        }
    }

    @keyframes close-animation {
        0%    { 
            width: 300px;
            height: 471px;
            border-radius: 10px
        }

        100%  { 
            width: 50px;
            height: 50px;
            border-radius: 25px
        }
    }

    @keyframes fade-out {
        from {
            opacity: 1;
        }

        to {
            opacity: 0;
        }
    }


    @keyframes fade-in {
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }

    cursor: pointer;
    position: sticky;
    background-color: #404040;
    bottom: 25px;
    left: calc(100% - 50px);
    align-items: center;
    justify-content: center;
    display: flex;
    border-radius: 25px;
    text-align: left;
    overflow: hidden;
    animation: close-animation .5s;

    ${shadow};

    nav {
        width: 100%;
        padding: 10px 0;
        list-style: none;
    }

    &:not(.open){
        width: 50px;
        height: 50px;

        nav {
            animation: fade-out .5s;
            display: none;
        }

        .navigation-icon {
            animation: fade-in 1s;
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
            animation: fade-out 1s;
            display: none;
        }

        nav {
            animation: fade-in .5s;
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