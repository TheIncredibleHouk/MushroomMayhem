import Block from "../Block/Block";
import PageTitleStyles from "./PageTitle.styles"

var kernFixes = ['i'];
var PageTitle = ({title, children, center}) => {
    return (
        <PageTitleStyles className={center && 'center'}>
            <Block color="#bcbcbc" boltSize={4}>
                <div className="page-title">
                    <div className="page-title-layout">
                        {title.toLowerCase().split('').map((letter, index) =>(
                            <span className={`letter_${index}
                                ${kernFixes.indexOf(letter) > -1 && 'kern-fix'}
                                ${letter === '\n' && 'break'}
                                ${letter === ' ' && 'break'}
                            `}>{letter}</span>
                        ))}
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