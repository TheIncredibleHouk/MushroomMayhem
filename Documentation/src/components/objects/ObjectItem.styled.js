import styled from 'styled-components';

const ObjectItemStyles = styled.div`
    border: 5px solid #10a802;
    border-radius: 5px;
    border-top: 0;
    display: inline-block;
    height: 405px;
    margin: 20px;
    position: relative;
    width: 266px;

    .object-name {
        background-color: #10a802;
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

    .object-description {
        font-size: 16px;
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 5px;
    }

    .object-icon {
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

    .object-mario {
        display: inline-block;
    }

    @media print {
        page-break-inside: avoid;
    }
`;

export default ObjectItemStyles;