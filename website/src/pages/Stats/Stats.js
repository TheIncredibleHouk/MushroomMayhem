import Block from "../../components/Block/Block";
import PageTitle from "../../components/PageTitle/PageTitle";
import { blue, green, red, yellow } from "../../styles/colors";
import StatsStyles from "./Stats.styles"

import StatusBar from './images/StatusBar.png';

var Stats = () => {
    return <>
        <PageTitle title="Stats">
            On this adventure, Mario has a lot of stats to keep track! Luckily, these stats are displayed in the status bar for you at
            the bottom of the screen. Check out the details on all the numbers and icons below!
        </PageTitle>
        <StatsStyles>
            <div className="stats stats-top">
                <div  className="stat-pmeter">
                    <Block boltSize={2} color={red}>P-Meter</Block>
                </div>
                <div className="stat-airmeter">
                    <Block boltSize={2} color={blue}>Air Meter</Block>
                </div>
                <div className="stat-levelstars">
                    <Block boltSize={2} color={yellow}>Stars</Block>
                </div>
                <div className="stat-daymeter">
                    <Block boltSize={2} color={green}>Clock</Block>
                </div>
                <div  className="stat-badge">
                    <Block boltSize={2} color={red}>Badge</Block>
                </div>
            </div>
            <div className="stat-image">
                <img src={StatusBar } />
            </div>
            <div className="stats stats-bottom">
                <Block className="stat-exp" boltSize={2} color={red}>Experience</Block>
                <Block className="stat-coins" boltSize={2} color={blue}>Coins</Block>
                <Block className="stat-totalstars" boltSize={2} color={yellow}>Total Stars</Block>
                <Block className="stat-cherries" boltSize={2} color={green}>Cherries</Block>
                <Block className="stat-item" boltSize={2} color={red}>Item</Block>
            </div>
        </StatsStyles>
    </>
};

export default Stats;