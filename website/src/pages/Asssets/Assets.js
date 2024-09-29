import Label from './images/Mario Adventure 3 Label.png';
import Logo from './images/Mario Adventure 3 Logo.png';
import CartBox from './images/Mario Adventure 3 Cart Box.png';
import CartLabel from './images/Mario Adventure 3 Cart Label.png';
import FoxMario from './images/Fox Mario.png';
import "./Assets.css";

const Assets = () => {
    return <div className="assets">
        <p>
        Feel free to use these assets when streaming your game or creating physical
            cartridges of the game!
        </p>
        <h1>Label</h1>
        <p><img src={Label} /></p>
        <h1>Logo</h1>
        <p><img src={Logo} /></p>
        <h1>Cart Box Art</h1>
        <p><img src={CartBox} /></p>
        <h1>Cart Label</h1>
        <p><img src={CartLabel}/></p>
        <h1>Fox Mario</h1>
        <p><img src={FoxMario}/></p>
    </div>
}

export default Assets;