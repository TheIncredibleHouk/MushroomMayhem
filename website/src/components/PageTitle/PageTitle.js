import Block from "../Block/Block";
import PageTitleStyles from "./PageTitle.styles"

var PageTitle = ({title, children}) => {
    return (
        <PageTitleStyles>
            <Block color="#bcbcbc" boltSize={4}>
                <div className="page-title">
                    <div className="page-title-layout">
                        {title.split('').map((letter, index) => <span className={`letter_${index}`}>{letter}</span>)}
                    </div>
                </div>
            </Block>
            <div className="page-description">
                {children}
            </div>
        </PageTitleStyles>
    );
};

export default PageTitle;