import BoxStyles from "./Box.styles"

var Box = ({color, header, children, ...props}) => {
    return (
        <BoxStyles className="box" color={color} {...props}>
            { header && <h1>{header}</h1> }
            <div className="box-layout">
                {children}
            </div>
        </BoxStyles>
    )
};

export default Box;