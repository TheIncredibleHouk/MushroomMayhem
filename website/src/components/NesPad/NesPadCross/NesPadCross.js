
import './NesPadCross.css';

var NesPadCross = ({up, down, left, right, inline=true}) => {
    return <div className={`nes-pad-cross ${inline ? 'inline' : ''}`}>
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
    </div>
};

export default NesPadCross;