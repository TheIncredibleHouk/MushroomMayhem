import NesPadActionStyles from "./NesPadAction.styles"

var NesPadAction = ({A, B, inline=true}) => {
    return (
        <NesPadActionStyles className={inline ? 'inline': ''}>
            <div className="nes-pad-action-layout">
                <div className={`B ${B}`}>B</div>
                <div className={`A ${A}`}>A</div>
            </div>
        </NesPadActionStyles>
    );
};

export default NesPadAction;