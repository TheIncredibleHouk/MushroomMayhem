import "./NesPad.css";
import NesPadAction from "./NesPadAction/NesPadAction"
import NesPadCross from "./NesPadCross/NesPadCross"
import NesPadMenu from "./NesPadMenu/NesPadMenu"

var NesPad = ({up, down, left, right, select, start, A, B, zoom = 1}) => {
    return <div className="nes-pad" style={{"zoom": zoom}}>
        <NesPadCross inline={false} up={up} down={down} left={left} right={right}/>
        <NesPadMenu inline={false} select={select} start={start} />
        <NesPadAction inline={false} A={A} B={B} showLabels={false} />
    </div>
};

export default NesPad;