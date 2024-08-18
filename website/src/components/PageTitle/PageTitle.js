import Block from "../Block/Block";
import "./PageTitle.css";
import { red, blue, yellow, green } from "../../styles/colors";

var kernFixes = ['i'];
const colors = [
    red, blue, yellow, green, red, green, yellow, blue, green, yellow, blue, red, green,
    red, blue, yellow, green, red, green, yellow, blue, green, yellow, blue, red, green,
    red, blue, yellow, green, red, green, yellow, blue, green, yellow, blue, red, green,
];
const PageTitle = ({title, children, center}) => {
    return (
        <div className={`page-title ${center && 'center'}`}>
            <Block color="#bcbcbc" boltSize={4}>
                <div className="page-title">
                    <div className="page-title-layout">
                        {title.toLowerCase().split('').map((letter, index) =>(
                            <span style={{["--letter-color"]: colors[index]}} className={`letter
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
        </div>
    );
};

export default PageTitle;