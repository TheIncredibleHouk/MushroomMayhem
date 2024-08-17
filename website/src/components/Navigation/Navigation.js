import { useEffect, useState } from "react";
import routes from "../../routing/routes";
import { Link } from "react-router-dom";

import './Navigation.css';

var Navigation = () => {
    var [opened, setOpened] = useState(false);

    useEffect(() => {

    }, [opened]);

    return (
        <div className={`navigation ${opened && 'open'}`} onClick={() => setOpened(!opened)}>
            <div className="navigation-icon">
                <div className="navigation-icon-bar" />
                <div className="navigation-icon-bar" />
                <div className="navigation-icon-bar" />
            </div>
            <nav>
                {routes.filter(route => route.menu).map(route => (
                    <li><Link to={route.path}>{route.title}</Link></li>
                ))}
                <li><a href="#" onClick={e => e.preventDefault()}>Close</a></li>
            </nav>
        </div>
    )
};

export default Navigation;