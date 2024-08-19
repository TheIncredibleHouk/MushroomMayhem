import './Box.css'

var Box = ({color, header, children, ...props}) => {
    return (
        <div className="box"
        style={{["--box-color"]: color }} {...props}>
            { header && <h2>{header}</h2> }
            <div className="box-layout">
                {children}
            </div>
        </div>
    )
};

export default Box;