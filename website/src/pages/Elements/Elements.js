import Box from "../../components/Box/Box";
import PageTitle from "../../components/PageTitle/PageTitle";
import { green } from "../../styles/colors";
import ElementsStyles from "./Elements.styles"
import NesPadAction from "../../components/NesPad/NesPadAction/NesPadAction";
import NesPadCross from "../../components/NesPad/NesPadCross/NesPadCross";

import Coin from './images/Coin.png';
import FrozenCoin from './images/FrozenCoin.png';
import Cherry from './images/Cherry.png';
import FrozenCherry from './images/FrozenCherry.png';
import RedSpring from './images/RedSpring.png';
import GreenSpring from './images/GreenSpring.png';
import GoldSpring from './images/GoldSpring.png';
import Key from './images/Key.png';
import LockedDoor from './images/LockedDoor.png';
import Door from './images/Door.png';
import LockBlock from './images/LockBlock.png';
import MushroomBlock from './images/MushroomBlock.png';
import StarCoin from './images/StarCoin.png';
import KeyCoin from './images/KeyCoin.png';
import OneUp from './images/OneUp.png';
import CoinLock from './images/CoinLock.png';
import EventLock from './images/EventLock.png';
import MagicStar from './images/MagicStar.png';
import Clock from './images/Clock.png';
import GreenCoin from './images/GreenCoin.png';
import QuestionBlock from './images/QuestionBlock.png';
import RotatingBlock from './images/RotatingBlock.png';
import BrickBlock from './images/BrickBlock.png';
import StoneBlock from './images/StoneBlock.png';
import Water from './images/Water.png';
import ThinIce from './images/ThinIce.png';
import IceBlock from './images/IceBlock.png';
import Weight from './images/Weight.png';
import Magnet from './images/Magnet.png';
import Vine from './images/Vine.png';
import Web from './images/WebThread.png';
import PSwitch from './images/PSwitch.png';
import ESwitch from './images/ESwitch.png';
import Bubble from './images/Bubble.png';
import HollowPBlock from './images/HollowPBlock.png';
import SolidPBlock from './images/SolidPBlock.png';

var elements = [
    {
        name: "Coin",
        image: Coin,
        description: "Collect these and take them to The Item Emporium to purchase items."
    },
    {
        name: "Frozen Coin",
        image: FrozenCoin,
        description: "Use fireballs to thaw these to collect the coin inside."
    },
    {
        name: "Cherry",
        image: Cherry,
        description: "The Badge Hut will take these in exchange for equipping items."
    },
    {
        name: "Frozen Cherry",
        image: FrozenCherry,
        description: "Use fireballs to thaw these to collect the cherry inside."
    },
    {
        name: "Key",
        image: Key,
        description: "Mario can use these to unlock doors and block paths with key holes."
    },
    {
        name: "Key Coin",
        image: KeyCoin,
        description: "Collect a number of these to create a key."
    },
    {
        name: "Locked Door",
        image: LockedDoor,
        description: "Pick up a key and bring it to a locked door to unlock it."
    },
    {
        name: "Door",
        image: Door,
        description: <>Move over a door and press <NesPadCross up /> to enter.</>
    },
    {
        name: "Lock Block",
        image: LockBlock,
        description: "Carrying a key to this block will unlock it and the path that it connects to."
    },
    {
        name: "Red Spring",
        image: RedSpring,
        description: <>Jump on these and hold <NesPadAction A /> to jump high! Mario can even carry and kick these.</>
    },
    {
        name: "Green Spring",
        image: GreenSpring,
        description: "A stronger version of the spring so Mario can jump even higher!"
    },
    {
        name: "Gold Spring",
        image: GoldSpring,
        description: "The strongest spring available. These will send you extremely high!!"
    },
    {
        name: "Mushroom Block",
        image: MushroomBlock,
        description: "Pick these up and toss them around to attack enemies. These can stack and Mario can stand on them."
    },
    {
        name: "1-Up Mushroom",
        image: OneUp,
        description: "Found at the end of training levels, these give Mario new, permanent abilities."
    },
    {
        name: "Clock",
        image: Clock,
        description: "For levels with a timer, clocks will add additional time."
    },
    {
        name: "Coin Lock",
        image: CoinLock,
        description: "Coin locks require a number of coins to remove the lock and clear the path they block."
    },
    {
        name: "Event Lock",
        image: EventLock,
        description: "Event locks require hitting an Event Switch to open them up."
    },
    {
        name: "Magic Star",
        image: MagicStar,
        description: "Most levels contain 3 Magic Stars. These are require to open the barrier to access a world's fortress level."
    },
    {
        name: "Star Coin",
        image: StarCoin,
        description: "Collecting 5 of these in an area will cause a Magic Star to appear."
    },
    {
        name: "Green Coin",
        image: GreenCoin,
        description: "Althrough rare, collecting 8 of these before they disappear will revel a Magic Star!"
    },
    {
        name: "Question Block",
        image: QuestionBlock,
        description: "The classic blind box! Hit one of these to reveal the surprise inside!"
    },
    {
        name: "Brick Block",
        image: BrickBlock,
        description: "Despite rumors, these are not Mushroom Kingdom citizens. Hit this to break them apart or reveal an item inside."
    },
    {
        name: "Rotating Block",
        image: RotatingBlock,
        description: "Hitting these will cause them to rotating for a moment. Mario cannot stand on them as they spin, but Fox Mario's dash can break these."
    },
    {
        name: "Stone Block",
        image: StoneBlock,
        description: "Only Hammers and explosions can break these open. This includes Sledge Mario's hammers and Hammer Bros.' hammers!"
    },
    {
        name: "Water",
        image: Water,
        description: "Mario can swim in water, but he cannot breathe under water."
    },
    {
        name: "Bubble",
        image: Bubble,
        description: "These can be found underwater and can give Mario a refill on his air meter."
    },
    {
        name: "Thin Ice",
        image: ThinIce,
        description: "Found at the surface of water, thin ice can hold Mario, but if he's carrying something, the ice will break. This can also be broken from below."
    },
    {
        name: "Ice Block",
        image: IceBlock,
        description: "While these do not contain any prizes, melting these usually leads to a bonus area!"
    },
    {
        name: "Weight",
        image: Weight,
        description: "These are simply weights that Mario can use to weigh himself down (like an Italian plumber really needs that)."
    },
    {
        name: "Magnet",
        image: Magnet,
        description: "Pick these up and throw them against iron bars so the stick. Then use these as platforms to gain higher ground!"
    },
    {
        name: "Vine",
        image: Vine,
        description: "Climb these to reach new heights! The Piranha at the end of these are friendly and won't harm Mario."
    },
    {
        name: "Web Thread",
        image: Web,
        description: "These can be found underground and can be climbed by Mario."
    },
    {
        name: "P-Switch",
        image: PSwitch,
        description: "Step on these to cause bricks to turn in to coins and vice versa."
    },
    {
        name: "E-Switch",
        image: ESwitch,
        description: "Step on one of these and different things will happen, such as unlocking a path or causing a flood!"
    },
    {
        name: "Hollow P-Block",
        image: HollowPBlock,
        description: "These blocks are hollow until a P-Switch is activated. Then they turn in to solid P-Blocks,"
    },
    {
        name: "Solid P-Block",
        image: SolidPBlock,
        description: "These blocks are solid until a P-Switch is activated. Then they turn in to hollow P-Blocks."
    },
]
var Elements = () => {
    return (
        <ElementsStyles>
            <PageTitle title="Game Elements">There are tons of elements that Mario will come across. From coins to Magic Stars,
            let's dive into the many items you'll come across spread through out the lands!</PageTitle>
            <div className="elements-layout">
                {elements.sort((e1, e2) => e1.name.localeCompare(e2.name)).map(element => (
                    <Box header={element.name} color={green}>
                        <div className="element-image"><img src={element.image} /></div>
                        <div className="element-text">{element.description}</div>
                    </Box>
                ))}
            </div>
        </ElementsStyles>
    )
};

export default Elements;