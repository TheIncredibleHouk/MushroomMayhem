import Block from "../Block/Block";
import PageHeaderStyles from "./PageHeader.styles";

var PageHeader = ({children, color}) => {
    return (
        <PageHeaderStyles color={color}>
            <Block boltSize={2} color={color}>
                <div className="page-header">
                    {children}
                </div>
            </Block>
        </PageHeaderStyles>
    )
};

export default PageHeader;