import PowerUpStyles from './PowerUps.styles';

import NesPadCross from '../../components/NesPad/NesPadCross/NesPadCross';
import NesPadAction from '../../components/NesPad/NesPadAction/NesPadAction';

import SuperMushroom from './images/SuperMushroom.png';
import SuperMario from './images/SuperMario.png';
import SuperMushroom1 from './images/SuperMushroom1.png';
import SuperMushroom2 from './images/SuperMushroom2.png';

import FireFlower from './images/FireFlower.png';
import FireMario from './images/FireMario.png';
import FireFlower1 from './images/FireFlower1.png';
import FireFlower2 from './images/FireFlower2.png';

import IceFlower from './images/IceFlower.png';
import IceMario from './images/IceMario.png';
import IceFlower1 from './images/IceFlower1.png';
import IceFlower2 from './images/IceFlower2.png';

import SuperLeaf from './images/SuperLeaf.png';
import RaccoonMario from './images/RaccoonMario.png';
import SuperLeaf1 from './images/SuperLeaf1.png';
import SuperLeaf2 from './images/SuperLeaf2.png';

import FoxLeaf from './images/FoxLeaf.png';
import FoxMario from './images/FoxMario.png';
import FoxLeaf1 from './images/FoxLeaf1.png';
import FoxLeaf2 from './images/FoxLeaf2.png';

import FrogSuit from './images/FrogSuit.png';
import FrogMario from './images/FrogMario.png';
import FrogSuit1 from './images/FrogSuit1.png';
import FrogSuit2 from './images/FrogSuit2.png';

import ShellSuit from './images/ShellSuit.png';
import KoopaMario from './images/KoopaMario.png';
import ShellSuit1 from './images/ShellSuit1.png';
import ShellSuit2 from './images/ShellSuit2.png';

import SledgeSuit from './images/SledgeSuit.png';
import SledgeMario from './images/SledgeMario.png';
import SledgeSuit1 from './images/SledgeSuit1.png';
import SledgeSuit2 from './images/SledgeSuit2.png';

import NinjaShroom from './images/NinjaShroom.png';
import NinjaMario from './images/NinjaMario.png';
import NinjaShroom1 from './images/NinjaShroom1.png';
import NinjaShroom2 from './images/NinjaShroom2.png';
import PageTitle from '../../components/PageTitle/PageTitle';
import Box from '../../components/Box/Box';
import { blue } from '../../styles/colors';

const powerUpList = [
    {
        name: "Super Mushroom",
        description: "Powers Mario up to Super Mario. Gives him the ability to break bricks with his bare hands!",
        powerUpImage: SuperMushroom,
        screenshots: [SuperMushroom2, SuperMushroom1],
        marioImage: SuperMario
    },
    {
        name: "Fire Flower",
        description: <>
            The classic fire power! Press <NesPadAction B /> to toss fire balls that can defeat many enemies and melt ice. Lob fireballs up by holding
            <NesPadCross up /> when pressing <NesPadAction B />.
        </>,
        powerUpImage: FireFlower,
        marioImage: FireMario,
        screenshots: [FireFlower2, FireFlower1]
    },
    {
        name: "Ice Flower",
        description:  <>
            A frosty twist on a classic. Press <NesPadAction B /> to toss ice balls that can freeze enemies.
            You can even freeze the surface of water and Munchers.
        </>,
        powerUpImage: IceFlower,
        marioImage: IceMario,
        screenshots: [IceFlower1, IceFlower2]
    },
    {
        name: "Super Leaf",
        description: <>
        Give Mario some raccoon aesthetics! Charging your P-Meter and jumping allows Mario to fly. Batting his tail with <NesPadAction B /> allows Mario to
        knock projectiles right back at enemies!
        </>,
        powerUpImage: SuperLeaf,
        marioImage: RaccoonMario,
        screenshots: [SuperLeaf1, SuperLeaf2]
    },
    {
        name: "Fox Leaf",
        description: <>
        Grow a fluffy tail with pointy ears! Fox Mario can dash forward by tapping <NesPadAction B /> twice. Additionally, Fox Mario is invulernable to fireballs and lava!
        </>,
        powerUpImage: FoxLeaf,
        marioImage: FoxMario,
        screenshots: [FoxLeaf1, FoxLeaf2]
    },
    {
        name: "Poison Frog Suit",
        description: <>
        Poison Frog Mario won't lose air underwater and isn't affected by wind and ice when his sticky feet touch the ground.
        Double tapping <NesPadAction B /> will make Mario invincible for a bit!
        </>,
        powerUpImage: FrogSuit,
        marioImage: FrogMario,
        screenshots: [FrogSuit1, FrogSuit2]
    },
    {
        name: "Koopa Shell Suit",
        description: <>
        Koopa Mario can go into a shell, just like a Koopa while holding <NesPadCross down /> once he has enough run speed.
        Mario will break bricks and even richoet off hazards from a above such as spikes and Munchers!
        </>,
        powerUpImage: ShellSuit,
        marioImage: KoopaMario,
        screenshots: [ShellSuit1, ShellSuit2]
    },
    {
        name: "Sledge Suit",
        description: <>
        Throw sledge hammers with <NesPadAction B /> and watch as they break brick and stone blocks. While in the air, Mario can
        hold <NesPadCross down /> and tap <NesPadAction B /> will send him downwards as a ground pound attack!
        </>,
        powerUpImage: SledgeSuit,
        marioImage: SledgeMario,
        screenshots: [SledgeSuit1, SledgeSuit2]
    },
    {
        name: "Ninja Mushroom",
        description: <>
        Press <NesPadAction B /> to throw shurikens and hold <NesPadCross up down left right /> to throw them in
        different directions! Press <NesPadCross left right /> while in the air and against a wall and Mario will slide down. Tap <NesPadAction A /> to wall
        jump off it!
        </>,
        powerUpImage: NinjaShroom,
        marioImage: NinjaMario,
        screenshots: [NinjaShroom1, NinjaShroom2]
    }
];

var PowerUps = () => {
    return <>
    <PageTitle title="Power-ups">Mario Adventure 3 contains several returning power-ups, such as the Fire Flower and Raccoon Leaf!
    However, Mario will come across several new power-ups on this quest and gain new abilities for familiar ones. Utilize all these
    powers to find hidden Magic Stars, secret areas, and determine who is responsible for these menacing Malice Mushrooms!
    </PageTitle>
     <PowerUpStyles>
        
        {
            powerUpList.map(powerUp => (
            <Box header={powerUp.name} color={'#4d9dde'}>
                <span className='power-up-image'>
                    <img src={powerUp.powerUpImage} />
                </span>
                <div className='power-up-layout'>
                    <div className="power-up-mario">
                        <img src={powerUp.marioImage} />
                    </div>
                    <span className="power-up-description">
                        {powerUp.description}
                    </span>
                    {powerUp.screenshots.map(screenshot => (
                        <div className="power-up-screenshot">
                            <img src={screenshot} />
                        </div>
                    ))}
                </div>
            </Box>
            ))
        }
        
    </PowerUpStyles>
    </>
};

export default PowerUps;