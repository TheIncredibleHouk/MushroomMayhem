import NesPad from "../../components/NesPad/NesPad";
import NesPadAction from "../../components/NesPad/NesPadAction/NesPadAction";
import NesPadCross from "../../components/NesPad/NesPadCross/NesPadCross";
import NesPadMenu from "../../components/NesPad/NesPadMenu/NesPadMenu";

const Cheats = () => {
  return <div>
    <h1>Title Screen - Cheat Codes</h1>
    <h2>World Select</h2>
    <p>Note that this code will erase your game file!!!!</p>
    <p>On the title screen hold <NesPadMenu select /> + <NesPadAction A /> + <NesPadAction B /> and hit <NesPadCross down   />. This will open a world select menu and allow you to start a new game from any world.</p>
    <h1>Options Screen - Cheat Codes</h1>
    <p>Perform all these cheat codes on the options screen. Press <NesPadMenu start /> on the map screen to enter into the Options screen.</p>
    <h2>Increase Ability</h2>
    <p>Open the options screen and press <NesPadAction B /> - <NesPadAction B /> - <NesPadAction A /> - <NesPadAction A /> - <NesPadCross up /> - <NesPadCross up /> - <NesPadCross up /> - <NesPadCross up /> - <NesPadCross up /></p>
    <p>
        <ol>
            <li>Getting hit when fully powered up takes you back to Super Mario instead of small Mario</li>
            <li>Start levels as Super Mario when small</li>
            <li>More invulnerability time when hit</li>
            <li>All item blocks contain the full power-up (no mushrooms)</li>
            <li>Enable double jump (<NesPadCross up /> + <NesPadAction A /> after jumping)</li>
            <li>Hold <NesPadAction A /> + <NesPadAction B /> anN press <NesPadMenu select /> with 50 cherries to gain a star power-up</li>
        </ol>
    </p>
    <h2>Add 250 coins</h2>
    <p>Open the options screen and press <NesPadCross up />  - <NesPadCross right /> - <NesPadCross down />  - <NesPadCross left />  - <NesPadCross up />  - <NesPadCross right />  - <NesPadCross down /> -  <NesPadCross left /></p>
    <h2>Add 25 cherries</h2>
    <p>Open the options screen and press <NesPadCross left /> - <NesPadCross down /> - <NesPadCross right /> - <NesPadCross down /> - <NesPadCross left /> - <NesPadCross down /> - <NesPadCross right /> - <NesPadCross down /> - <NesPadCross left /> </p> 
    <h2>Add 1000 experience</h2>
    <p>Open the options screen and press <NesPadCross left /> - <NesPadCross right /> - <NesPadMenu select /> - <NesPadAction B /> - <NesPadAction A /> - <NesPadAction B /> - <NesPadMenu select /> - <NesPadCross right /> - <NesPadCross left /></p>
    <h2>Level Skips</h2>
    <p>Move over any level, open the options screen and press the following to move over the level:
        <ul>
            <li> Move over a level to the right - <NesPadAction A /> - <NesPadAction A /> - <NesPadAction A /> - <NesPadCross right /> - <NesPadCross right /> - <NesPadCross right /> - <NesPadCross right /> - <NesPadCross right /> - <NesPadCross right /> </li>
            <li> Move over a level above - <NesPadAction A /> - <NesPadAction A /> - <NesPadAction A /> - <NesPadCross up /> - <NesPadCross up /> - <NesPadCross up /> - <NesPadCross up /> - <NesPadCross up /> - <NesPadCross up /> </li>
            <li> Move over a level to the left - <NesPadAction A /> - <NesPadAction A /> - <NesPadAction A /> - <NesPadCross left /> - <NesPadCross left /> - <NesPadCross left /> - <NesPadCross left /> - <NesPadCross left /> - <NesPadCross left /> </li>
            <li> Move over a level below - <NesPadAction A /> - <NesPadAction A /> - <NesPadAction A /> - <NesPadCross down /> - <NesPadCross down /> - <NesPadCross down /> - <NesPadCross down /> - <NesPadCross down /> - <NesPadCross down /> </li>
        </ul>
    </p>
    <h2>Moon Gravity</h2>
    <p>Open the options screen and press <NesPadAction B /> - <NesPadCross right /> - <NesPadAction A /> - <NesPadAction B /> - <NesPadAction B /> - <NesPadCross up /> - <NesPadCross left /> - <NesPadMenu select /> </p>
    <h2>Play a level with Marine Pop</h2>
    <p>Open the options screen and press <NesPadCross up /> - <NesPadCross right /> - <NesPadMenu select /> - <NesPadCross up /> - <NesPadCross left /> - <NesPadAction A /> - <NesPadMenu select /> - <NesPadCross up /> - <NesPadAction B /></p>
    <h2>Enable Debug Mode</h2>
    <p>This code only lasts for a single level. Open the options screen and press <NesPadCross up /> - <NesPadCross down /> - <NesPadCross up /> - <NesPadCross down /> - <NesPadAction B /> - <NesPadAction B /> - <NesPadAction A /> - <NesPadAction A /></p>
    <p>In a level, hold <NesPadAction B /> and press <NesPadMenu select /> to cycle through the different powerups.</p>
  </div>;
};

export default Cheats;
