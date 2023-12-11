import BlockStyles from "./Block.styles"

var Block = ({children, color, boltSize, ...props}) => {
    return <BlockStyles className="block" {...props} color={color} boltSize={boltSize}>
        <span className="bolt_1" />
        <span className="bolt_2" />
        <span className="bolt_3" />
        <span className="bolt_4" />
        <div className="block-layout">
            {children}
        </div>
    </BlockStyles>
};

export default Block;