import Block from "../../components/Block/Block";
import PageTitle from "../../components/PageTitle/PageTitle";
import { blue, green, red, yellow } from "../../styles/colors";
import StatsStyles from "./Stats.styles";

import StatusBar from "./images/StatusBar.png";
import NesPadMenu from '../../components/NesPad/NesPadMenu/NesPadMenu';

var Stats = () => {
  return (
    <>
      <PageTitle title="Player Stats">
        On this adventure, Mario has a lot of stats to keep track! Luckily,
        these stats are displayed in the status bar for you at the bottom of the
        screen. Check out the details on all the numbers and icons below!
      </PageTitle>
      <StatsStyles>
        <div className="stats-descriptions">
          <div className="stat-description">
            <h1 style={{ backgroundColor: red }}>P-Meter</h1>
            <div className="stat-description-text">
              The P-Meter represents Mario's power. Many power-ups make use of this to indicate ability time remaining.
            </div>
          </div>
          <div className="stat-description">
            <h1 style={{ backgroundColor: blue }}>Air Meter</h1>
            <div className="stat-description-text">
              Mario normally cannot breath underwater and this indicates how much
              air is left. A sound will play when Mario is low on air.
            </div>
          </div>
          <div className="stat-description">
            <h1 style={{ backgroundColor: yellow }}>Level Stars</h1>
            <div className="stat-description-text">
              This indicates the stars collected for a particular level. There
              are 3 stars on most levels. This will be blank if there are no stars for that level.
            </div>
          </div>
          <div className="stat-description">
            <h1 style={{ backgroundColor: green }}>Sun Dial</h1>
            <div className="stat-description-text">
              Time flows during level play and day time will switch to night
              time. This meter indicates how much longer the current time of day
              is.
            </div>
          </div>
          <div className="stat-description">
            <h1 style={{ backgroundColor: red }}>Badge</h1>
            <div className="stat-description-text">
             Currently equipped badge. Equip a diffferent badge at The Badge Hut!
            </div>
          </div>
        </div>
        <div className="stats-explanation">
          <div className="stats stats-top">
            <div className="stat-pmeter">
              <Block boltSize={2} color={red}>
                P-Meter
              </Block>
            </div>
            <div className="stat-airmeter">
              <Block boltSize={2} color={blue}>
                Air Meter
              </Block>
            </div>
            <div className="stat-levelstars">
              <Block boltSize={2} color={yellow}>
                Level Stars
              </Block>
            </div>
            <div className="stat-daymeter">
              <Block boltSize={2} color={green}>
                Sun Dial
              </Block>
            </div>
            <div className="stat-badge">
              <Block boltSize={2} color={red}>
                Badge
              </Block>
            </div>
          </div>
          <div className="stat-image">
            <img src={StatusBar} />
          </div>
          <div className="stats stats-bottom">
            <div className="stat-exp">
              <Block boltSize={2} color={red}>
                Experience
              </Block>
            </div>
            <div className="stat-coins">
              <Block boltSize={2} color={blue}>
                Coins
              </Block>
            </div>
            <div className="stat-totalstars">
              <Block boltSize={2} color={yellow}>
                Total Stars
              </Block>
            </div>
            <div className="stat-cherries">
              <Block boltSize={2} color={green}>
                Cherries
              </Block>
            </div>
            <div className="stat-item">
              <Block boltSize={2} color={red}>
                Item
              </Block>
            </div>
          </div>
        </div>
        <div className="stats-descriptions">
          <div className="stat-description">
            <h1 style={{ backgroundColor: red }}>Experience</h1>
            <div className="stat-description-text">
             Mario gains experience through different actions in the game. Once Mario has gained enough experience, he can attempt
             a training level to level up his abilities!
            </div>
          </div>
          <div className="stat-description">
            <h1 style={{ backgroundColor: blue }}>Coins</h1>
            <div className="stat-description-text">
              Current number of coins (up to 9999). Use these to purchase items at the The Item Emporium.
            </div>
          </div>
          <div className="stat-description">
            <h1 style={{ backgroundColor: yellow }}>Total Stars</h1>
            <div className="stat-description-text">
              Indicates the total number of stars Mario has collected in the game.
            </div>
          </div>
          <div className="stat-description">
            <h1 style={{ backgroundColor: green }}>Cherries</h1>
            <div className="stat-description-text">
              Current number of cherries (up to 99). Mario can exchange these for equipping a badge.
            </div>
          </div>
          <div className="stat-description">
            <h1 style={{ backgroundColor: red }}>Item</h1>
            <div className="stat-description-text">
              The current held item that can be used with the <NesPadMenu select /> button.
            </div>
          </div>
        </div>
      </StatsStyles>
    </>
  );
};

export default Stats;
