import Home from '../pages/Home/Home';
import Items from '../pages/Items/Items';
import PowerUps from '../pages/PowerUps/PowerUps'
import Stats from '../pages/Stats/Stats';

const routes = [
    {
        path: "",
        component: Home,
        exact: true
    },
    {
        path: "power-ups",
        component: PowerUps,
        exact: true
    },
    {
        path: "stats",
        component: Stats,
        exact: true
    },
    {
        path: "items",
        component: Items,
        exact: true
    }
];

export default routes;