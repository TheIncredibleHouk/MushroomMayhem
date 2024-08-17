import Block from "../Block/Block";
import './PageHeader.css';

var PageHeader = ({children, color = "#FFFFFF"}) => {
    return (
        <div style={{["--color"]: color}}>
            <Block boltSize={2} color={color}>
                <div className="page-header">
                    {children}
                </div>
            </Block>
        </div>
    )
};

export default PageHeader;