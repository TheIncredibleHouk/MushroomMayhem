import Elements from '../pages/Elements/Elements';
import Foes from '../pages/Foes/Foes';
import Hazards from '../pages/Hazards/Hazards';
import Home from '../pages/Home/Home';
import Items from '../pages/Items/Items';
import LevelGuide from '../pages/LevelGuide/LevelGuide';
import PowerUps from '../pages/PowerUps/PowerUps'
import Basics from '../pages/Basics/Basics';
import Techniques from '../pages/Techniques/Techniques';
import WorldGuide from '../pages/WorldGuide/WorldGuide';
import BobombBasin from '../pages/Worlds/BobombBasin/BobombBasin';
import BulletBillBay from '../pages/Worlds/BulletBillBay/BulletBillBay';
import CheepCheepChannel from '../pages/Worlds/CheepCheepChannel/CheepCheepChannel';
import DryBonesDesert from '../pages/Worlds/DryBonesDesert/DryBonesDesert';
import FreezieForest from '../pages/Worlds/FreezieForest/FreezieForest';
import Koopatropolis from '../pages/Worlds/Koopatropolis/Koopatropolis';
import PiranhaPassage from '../pages/Worlds/PiranhaPassage/PiranhaPassage';
import Demos from '../pages/Basics/Demos/Demos';
import About from '../pages/About/About';

const routes = [
    {
        path: "",
        component: Home,
        exact: true,
        title: "Home",
        menu: true
    },
    {
        path: "about",
        component: About,
        exact: true,
        title: "About",
        menu: true
    },
    {
        path: "demos",
        component: Demos,
        expect: true,
        title: "Demos",
        menu: true
    },
    {
        path: "basics",
        component: Basics,
        exact: true,
        title: "Basics",
        menu: true
    },
    {
        path: "power-ups",
        component: PowerUps,
        exact: true,
        title: "Power-Ups",
        menu: true
    },
    {
        path: "items",
        component: Items,
        exact: true,
        title: "Items",
        menu: true
    },
    {
        path: "techniques",
        component: Techniques,
        exact: true,
        title: "Techniques",
        menu: true
    },    
    {
        path: "elements",
        component: Elements,
        exact: true,
        title: "Game Elements",
        menu: true
    },
    {
        path: "hazards",
        component: Hazards,
        exact: true,
        title: "Hazards",
        menu: true
    },
    // {
    //     path: "foes",
    //     component: Foes,
    //     exact: true,
    //     title: "Foes",
    //     menu: true
    // },
    // {
    //     path: "world-guide",
    //     component: WorldGuide,
    //     exact: true,
    //     title: "World Guide",
    //     menu: true
    // },
    // {
    //     path: "level-guide",
    //     component: LevelGuide,
    //     exact: true,
    //     title: "Level Guide",
    //     menu: true
    // },
];

export default routes;