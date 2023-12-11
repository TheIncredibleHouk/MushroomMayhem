import NesPadMenuStyles from "./NesPadMenu.styles";

var NesPadMenu = ({select, start, inline=true}) => {
    return (
        <NesPadMenuStyles className={inline ? 'inline' : ''}>
            <div className="nes-pad-menu-layout">
                <div className={`select ${select}`}>
                    SELECT
                </div>
                <div className={`start ${start}`}>
                    START
                </div>
            </div>
        </NesPadMenuStyles>
    )
};

export default NesPadMenu;