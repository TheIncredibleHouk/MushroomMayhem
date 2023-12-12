import { useEffect, useState } from "react";
import routes from "../../routing/routes";
import NavigationStyles from "./Navigation.styles";
import { Link } from "react-router-dom";

var Navigation = () => {
    var [opened, setOpened] = useState(false);

    useEffect(() => {

    }, [opened]);

    return (
        <NavigationStyles className={opened && 'open'} onClick={() => setOpened(!opened)}>
            <div className="navigation-icon">
                <div className="navigation-icon-bar" />
                <div className="navigation-icon-bar" />
                <div className="navigation-icon-bar" />
            </div>
            <nav>
                {routes.map(route => (
                    <li><Link to={route.path}>{route.title}</Link></li>
                ))}
                <li><a href="#" onClick={e => e.preventDefault()}>Close</a></li>
            </nav>
        </NavigationStyles>
    )
};

export default Navigation;