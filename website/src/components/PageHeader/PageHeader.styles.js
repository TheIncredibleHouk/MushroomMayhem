import styled from 'styled-components';
import { mobile } from '../../styles/mobile';
import { shadow } from '../../styles/shadows';

var PageHeaderStyles = styled.div`
    font-family: 'BabyTeeth';
    font-size: 54px;
    background-color: #FFFFFF;
    color: ${props => props.color};
    display: inline-block;
    position: relative;
    margin-left: 20px;
    margin-bottom: 25px;
    width: auto;
    color: #FFFFFF;
    ${shadow};
    -webkit-text-stroke: 2px #000000;
    margin-left: -10px;
    text-align: center;

    @media screen and (max-width: ${mobile}){
        margin-left: 0;
    }
`;

export default PageHeaderStyles;