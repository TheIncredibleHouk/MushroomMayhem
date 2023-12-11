import PowerUps from '../pages/PowerUps/PowerUps'
import Stats from '../pages/Stats/Stats';

const routes = [
    {
        path: "power-ups",
        component: PowerUps,
        exact: true
    }, {
        path: "stats",
        component: Stats,
        exact: true
    }
];

export default routes;