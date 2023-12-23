import styled from 'styled-components';
import { mobile } from '../../styles/mobile';
import ItemBox from './images/ItemBox.png';

var ItemStyles = styled.div`
    .items-layout, .items-example, .items-list {
        margin-bottom: 25px;
    }

    .items-layout {
        display: flex;
        flex-direction: column;
        align-items: center;
        align-content: center;
        justify-content: center;
        margin-bottom: 25px;

        .nespad {
            margin: 0 5px;
        }
    }

    .items-example {
        display: flex;
        flex-direction: row;
        align-items: center;
        img, .nespad {
            margin-bottom: 15px;
        }
    }

    .item-box {
        display: flex;
        flex-direction: row;
        align-items: center;

        .item-box-icon {
            width: 80px;
            height: 80px;
            padding: 16px;
            background-image: url('${ItemBox}');
            background-repeat: no-repeat;
            background-position: 0 0;
            background-size: cover;
            margin-right: 16px;
            display: flex;
            justify-content: center;

            img {
                width: 48px;
            }
        }
    }

    .items-list {
        display: grid;
        grid-template-columns: 1fr 1fr;
        justify-content: center;
        align-items: center;
        justify-items: center;
    }

    .items-shop {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        margin-top: 50px;
        justify-items: center;
        img {
            margin-bottom: 15px;
        }
    }

    @media screen and (max-width: ${mobile}) {
        .items-list, .items-shop {
            grid-template-columns: 1fr;
        }

        .items-example {
            flex-direction: column;
        }
    }
`;

export default ItemStyles;