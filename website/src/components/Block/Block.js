import "./Block.css";

const Block = ({children, color, boltSize, ...props}) => {
    return <div style={{
        ["--bolt-size"]: `${boltSize}px`,
        ["--block-color"]: `${color}`
    }}
    className="block"
    color={color}
    {...props} >
        <span className="lighting-top"></span>
        <span className="lighting-left"></span>
        <span className="lighting-right"></span>
        <span className="lighting-bottom"></span>
        <span className="bolt_1" />
        <span className="bolt_2" />
        <span className="bolt_3" />
        <span className="bolt_4" />
        <div className="block-layout">
            {children}
        </div>
    </div>
};

export default Block;