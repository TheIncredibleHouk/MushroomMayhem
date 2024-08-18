import "./NesPadAction.css";

var NesPadAction = ({A, B, inline=true}) => {
    return (
        <div className={`nes-pad-action ${inline ? 'inline': ''}`}>
            <div className="nes-pad-action-layout">
                <div className={`B ${B}`}>B</div>
                <div className={`A ${A}`}>A</div>
            </div>
        </div>
    );
};

export default NesPadAction;