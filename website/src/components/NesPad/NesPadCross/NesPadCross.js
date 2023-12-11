
import NesPadCrossStyles from "./NesPadCross.styles";

var NesPadCross = ({up, down, left, right, inline=true}) => {
    return <NesPadCrossStyles className={inline ? 'inline' : ''}>
        <div className={`nes-pad-cross-layout `}>
            <div />
            <div className={`up ${up}`} />
            <div />
            <div className={`left ${left}`} />
            <div className="center" />
            <div className={`right ${right}`} />
            <div />
            <div className={`down ${down}`} />
        </div>
    </NesPadCrossStyles>
};

export default NesPadCross;