import Collectibles from '../pages/Collectibles/Collectibles';
import Home from '../pages/Home/Home';
import Items from '../pages/Items/Items';
import PowerUps from '../pages/PowerUps/PowerUps'
import Stats from '../pages/Stats/Stats';

const routes = [
    {
        path: "",
        component: Home,
        exact: true,
        title: "Home"
    },
    {
        path: "power-ups",
        component: PowerUps,
        exact: true,
        title: "Power-Ups"
    },
    {
        path: "stats",
        component: Stats,
        exact: true,
        title: "Player Stats"
    },
    {
        path: "items",
        component: Items,
        exact: true,
        title: "Items"
    },
    {
        path: "collectibles",
        component: Collectibles,
        exact: true,
        title: "Collectibles"
    }
];

export default routes;