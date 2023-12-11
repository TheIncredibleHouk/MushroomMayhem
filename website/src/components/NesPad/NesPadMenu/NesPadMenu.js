import NesPadMenuStyles from "./NesPadMenu.styles";

var NesPadMenu = ({select, start}) => {
    return (
        <NesPadMenuStyles>
            <div className={`select ${select}`} />
            <div className={`start ${start}`} />
        </NesPadMenuStyles>
    )
};

export default NesPadMenu;