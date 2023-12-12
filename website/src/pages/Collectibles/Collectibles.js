import Box from "../../components/Box/Box";
import PageTitle from "../../components/PageTitle/PageTitle";
import { green } from "../../styles/colors";
import CollectiblesStyles from "./Collectibles.styles"
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

var collectibles = [
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
        description: "Collect a number of these to create a key.d"
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
]
var Collectibles = () => {
    return (
        <CollectiblesStyles>
            <PageTitle title="Collectibles">There are tons of collectibles that Mario will come across. From coins to Magic Stars,
            let's dive into the many items you'll come across spread through out the lands!</PageTitle>
            <div className="collectibles-layout">
                {collectibles.map(collectible => (
                    <Box header={collectible.name} color={green}>
                        <img src={collectible.image} />
                        <div className="collectible-text">{collectible.description}</div>
                    </Box>
                ))}
            </div>
        </CollectiblesStyles>
    )
};

export default Collectibles;