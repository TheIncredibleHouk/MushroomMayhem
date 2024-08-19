import Block from "../../components/Block/Block";
import { blue, green, red, yellow } from "../../styles/colors";
import './Basics.css';
import NesPadCross from "../../components/NesPad/NesPadCross/NesPadCross";
import NesPadAction from "../../components/NesPad/NesPadAction/NesPadAction";
import Box from "../../components/Box/Box";

import StatusBar from "./images/StatusBar.png";
import NesPadMenu from "../../components/NesPad/NesPadMenu/NesPadMenu";

import Arrow from "../../images/right-arrow.png";
import Save1 from "./images/Save1.png";
import Save2 from "./images/Save2.png";
import Save3 from "./images/Save3.png";
import Save4 from "./images/Save4.png";
import Save5 from "./images/Save5.png";
import Save6 from "./images/Save6.png";
import World from './images/World.png';
import Level from './images/Level.png';
import Pipe from './images/Pipe.png';
import Fortress from './images/Fortress.png';
import MaliceMushroom1 from './images/MaliceMushroom1.png';
import MaliceMushroom2 from './images/MaliceMushroom2.png';
import MagicStar1 from './images/MagicStar1.png';
import MagicStar2 from './images/MagicStar2.png';
import Barrier1 from './images/Barrier1.png';
import Barrier2 from './images/Barrier2.png';
import ItemEmporium from './images/ItemEmporium.png';
import BadgeHut from './images/BadgeHut.png';
import TrainingGrounds from './images/TrainingGrounds.png';
import ItemEmporium1 from './images/ItemShop1.png';
import ItemEmporium2 from './images/ItemShop2.png';
import BadgeHut1 from './images/BadgeHut1.png';
import BadgeHut2 from './images/BadgeHut2.png';
import TrainingGrounds1 from './images/TrainingGrounds1.png';
import TrainingGrounds2 from './images/TrainingGrounds2.png';
import Checkpoint1 from './images/Checkpoint1.png';
import Checkpoint2 from './images/Checkpoint2.png';


var Basics = () => {
  return (
    <>
      <div className="basics">
        <h1>Basics</h1>
        <section>
          Mario Adventure 3 has a lot going on and it can be pretty
          overwhelming! Get up to speed with all the game basics on this page.
          </section>
        <h2>Game Saves</h2>
        <section className="basics-layout">
          Mario Adventure 3 supports a save system. The save system will save
          Mario's progress, including the levels Mario has completed, Magic
          Stars collected, all player stats and the current map location. To
          save the game, press <NesPadMenu start /> on the map screen. The first
          option is SAVE, but pressing <NesPadMenu select /> will highlight
          EXIT. Exit only exits the menu, not the game. Save updates the saved
          progress in your game.
          <div className="basics-screenshots">
            <img src={Save2} />
            <img className="right-arrow" src={Arrow} />
            <img src={Save3} />
          </div>
          When you restart the game, the title screen will be updated to let you
          know that you can CONTINUE or start a NEW GAME. Pressing{" "}
          <NesPadMenu start /> will continue your game. However, pressing{" "}
          <NesPadMenu select /> will highlight the NEW GAME menu item. Hitting{" "}
          <NesPadMenu start /> will prompt for a confirmation first. NO will be
          highlighted, but pressing <NesPadMenu select /> will highlight YES.
          Hitting <NesPadMenu start /> will confirm your option. Choosing NO
          will retain your game, but choosing YES will erase your game and start
          a new adventure!
          <div className="basics-screenshots">
            <img src={Save4} />
            <img className="right-arrow" src={Arrow} />
            <img src={Save5} />
          </div>
          <div className="basics-screenshots">
            <img src={Save6} />
            <img className="right-arrow" src={Arrow} />
            <img src={Save1} />
          </div>
        </section>
        <h2>Status Bar</h2>
        <section className="basics-layout">
          <div className="stats-descriptions">
            <div className="stat-description">
              <h1 style={{ backgroundColor: red }}>P-Meter</h1>
              <div className="stat-description-text">
                The P-Meter represents Mario's power. Many power-ups make use of
                this to indicate ability time remaining.
              </div>
            </div>
            <div className="stat-description">
              <h1 style={{ backgroundColor: blue }}>Air Meter</h1>
              <div className="stat-description-text">
                Mario normally cannot breath underwater and this indicates how
                much air is left. A sound will play when Mario is low on air.
              </div>
            </div>
            <div className="stat-description">
              <h1 style={{ backgroundColor: yellow }}>Level Stars</h1>
              <div className="stat-description-text">
                This indicates the stars collected for a particular level. There
                are 3 stars on most levels. This will be blank if there are no
                stars for that level.
              </div>
            </div>
            <div className="stat-description">
              <h1 style={{ backgroundColor: green }}>Sun Dial</h1>
              <div className="stat-description-text">
                Time flows during level play and day time will switch to night
                time. This meter indicates how much longer the current time of
                day is.
              </div>
            </div>
            <div className="stat-description">
              <h1 style={{ backgroundColor: red }}>Badge</h1>
              <div className="stat-description-text">
                Currently equipped badge. Equip a diffferent badge at The Badge
                Hut!
              </div>
            </div>
          </div>
          <section className="stats-explanation">
            <div className="stats stats-top">
              <div className="stat-pmeter border-top" style={{["--border-color"] : red}}>
                <Block boltSize={2} color={red}>
                  P-Meter
                </Block>
              </div>
              <div className="stat-airmeter border-top high" style={{["--border-color"]: blue}}>
                <Block boltSize={2} color={blue}>
                  Air Meter
                </Block>
              </div>
              <div className="stat-levelstars border-top" style={{["--border-color"]: yellow}}>
                <Block boltSize={2} color={yellow}>
                  Level Stars
                </Block>
              </div>
              <div className="stat-daymeter border-top high" style={{["--border-color"]: green}}>
                <Block boltSize={2} color={green}>
                  Sun Dial
                </Block>
              </div>
              <div className="stat-badge border-top" style={{["--border-color"]: red}}>
                <Block boltSize={2} color={red}>
                  Badge
                </Block>
              </div>
            </div>
            <div className="stat-image">
              <img src={StatusBar} />
            </div>
            <section className="stats stats-bottom">
              <div className="stat-exp border-bottom" style={{["--border-color"]: red}}>
                <Block boltSize={2} color={red}>
                  Experience
                </Block>
              </div>
              <div className="stat-coins border-bottom high" style={{["--border-color"]: blue}}>
                <Block boltSize={2} color={blue}>
                  Coins
                </Block>
              </div>
              <div className="stat-totalstars border-bottom" style={{["--border-color"]: yellow}}>
                <Block boltSize={2} color={yellow}>
                  Total Stars
                </Block>
              </div>
              <div className="stat-cherries border-bottom high" style={{["--border-color"]: green}}>
                <Block boltSize={2} color={green}>
                  Cherries
                </Block>
              </div>
              <div className="stat-item border-bottom" style={{["--border-color"]: red}}>
                <Block boltSize={2} color={red}>
                  Item
                </Block>
              </div>
            </section>
          </section>
          <section className="stats-descriptions">
            <div className="stat-description">
              <h1 style={{ backgroundColor: red }}>Experience</h1>
              <div className="stat-description-text">
                Mario gains experience through different actions in the game.
                Once Mario has gained enough experience, he can attempt a
                training level to level up his abilities!
              </div>
            </div>
            <div className="stat-description">
              <h1 style={{ backgroundColor: blue }}>Coins</h1>
              <div className="stat-description-text">
                Current number of coins (up to 9999). Use these to purchase
                items at the The Item Emporium.
              </div>
            </div>
            <div className="stat-description">
              <h1 style={{ backgroundColor: yellow }}>Total Stars</h1>
              <div className="stat-description-text">
                Indicates the total number of stars Mario has collected in the
                game.
              </div>
            </div>
            <div className="stat-description">
              <h1 style={{ backgroundColor: green }}>Cherries</h1>
              <div className="stat-description-text">
                Current number of cherries (up to 99). Mario can exchange these
                for equipping a badge.
              </div>
            </div>
            <div className="stat-description">
              <h1 style={{ backgroundColor: red }}>Item</h1>
              <div className="stat-description-text">
                The current held item that can be used with the{" "}
                <NesPadMenu select /> button.
              </div>
            </div>
          </section>
          <h2>World Map</h2>
          <section className="basics-layout">
            Mario will travel from level to level on the world map. The world map contains levels, shops, pipes and fortresses.
            Mario can navigate the world map using the <NesPadCross /> pad and enter levels with the <NesPadAction A /> button.
            Pressing <NesPadMenu start /> will bring up the save screens.
            <p><b>Note: There is no inventory screen in Mario Adventure 3.</b></p>
            The world map will reflect the current time of day (day or night). Also, as Mario moves around the map, going over
            a level will display the level's name and any Magic Stars that have been collected for that level. If the level does not
            have any Magic Stars to collect, then the Magic Stars section of the status bar will be blank.
            <section className="basics-screenshots">
              <img src={World} />
            </section>
            <section className="basics-table">
              <Box color={green} header="Level Icon">
                <img src={Level} />
                <span>
                  This indicates a normal level containg 3 Magic Stars and a Malice Mushroom to find and destroy!
                </span>
              </Box>
              <Box color={green} header="Item Emporium">
                <img src={ItemEmporium} />
                <span>
                  This icon indicates a shop to purchase items with coins.
                </span>
              </Box>
              <Box color={green} header="Badge Hut">
                <img src={BadgeHut} />
                <span>
                  This icon indicates a place to trade cherries for equipping a badge.
                </span>
              </Box>
              <Box color={green} header="Training Grounds">
                <img src={TrainingGrounds} />
                <span>
                  This icon indicates the training grounds to earn a new ability.
                </span>
              </Box>
              <Box color={green} header="Fortress">
                <img src={Fortress} />
                <span>
                  This icon indicates a blockade guarded by a boss. These require a number of Magic Stars to access.
                </span>
              </Box>
              <Box color={green} header="Pipe">
                <img src={Pipe} />
                <span>
                  This icon indicates a small level for transitioning across maps.
                </span>
              </Box>
            </section>
            <h2>Levels</h2>
            <section className="basics-layout">
              Normal levels contain a Malice Mushroom to find. Defeating the Malice Mushroom will
              destroy all objects around you and end the level. Malice Mushrooms can be defeated by stomping on them or
              attacking them in anyway.
              <div className="basics-screenshots">
                <img src={MaliceMushroom1} />
                <img className="right-arrow" src={Arrow} />
                <img src={MaliceMushroom2} />
              </div>
            </section>
            <section className="basics-layout">
              Normal levels also contain 3 Magic Stars that are hidden within the level. Collect these to unlock barriers in to the
              fortress levels.
              <div className="basics-screenshots">
                <img src={MagicStar1} />
                <img className="right-arrow" src={Arrow} />
                <img src={MagicStar2} />
              </div>
            </section>
            <section className="basics-layout">
              Fortress levels are blocked by barriers that require a number of Magic Stars to by pass. Be sure to collect Magic Stars 
              along the way to avoid needing to back track!
              <div className="basics-screenshots">
                <img src={Barrier1} />
                <img className="right-arrow" src={Arrow} />
                <img src={Barrier2} />
              </div>
            </section>
          </section>
          <h2>Checkpoints</h2>
            <section className="basics-layout">
              Checkpoint flags can be found within most levels of the game (not all levels have checkpoints) and some levels
              (fortresses) contain multiple checkpoints. Dying in a level will reset Mario's stats to what they were when he
              entered a level, but a checkpoint saves those stats at that point. A checkpoint for a level will remain until
              Mario grabs a different checkpoint or completes any level.
              <div className="basics-screenshots">
                <img src={Checkpoint1} />
                <img className="right-arrow" src={Arrow} />
                <img src={Checkpoint2} />
              </div>
            </section>
          <h2>Item Emporium</h2>
          <section className="basics-layout">
            The Item Emporium is where Mario can purchase items to use in a level. To use an item, pressing the <NesPadMenu select /> button.
            You can only have one item at a time, but some badges make use of the item slot and thus, items are not compatible with those badges
            and you will lose them. On some days, the Item Emporium will offer a discount!
            <div className="basics-screenshots">
                <img src={ItemEmporium1} />
                <img className="right-arrow" src={Arrow} />
                <img src={ItemEmporium2} />
              </div>
          </section>
          <h2>Badge Hut</h2>
          <section className="basics-layout">
            The Badge Hut is where Mario can trade cherries for badges! Badges are a one level use, meaning they are used up once Mario
            completes any level. On some days, the Badge Hut will offer a discount!
          </section>
          <section className="basics-layout">
            <div className="basics-screenshots">
                <img src={BadgeHut1} />
                <img className="right-arrow" src={Arrow} />
                <img src={BadgeHut2} />
              </div>
          </section>
          <h2>Training Grounds</h2>
          <section className="basics-layout">The Training Grounds is where Mario proves his strength and earns new abilities! Each door requires a number of experience
          points to access and completing a training level ends with an ability upgrade!
          </section>
          <section className="basics-layout">
            <div className="basics-screenshots">
                <img src={TrainingGrounds1} />
                <img className="right-arrow" src={Arrow} />
                <img src={TrainingGrounds2} />
              </div>
          </section>
        </section>
      </div>
    </>
  );
};

export default Basics;
