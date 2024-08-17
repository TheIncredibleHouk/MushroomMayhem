import "./NesPadMenu.css";

var NesPadMenu = ({ select, start, inline = true }) => {
  return (
    <div className={`nes-pad-menu ${inline ? "inline" : ""}`}>
      <div className="nes-pad-menu-layout">
        <div className={`select ${select}`}>SELECT</div>
        <div className={`start ${start}`}>START</div>
      </div>
    </div>
  );
};

export default NesPadMenu;
