import { BrowserRouter, Routes, Route } from "react-router-dom";
import routes from "./routes";
import Navigation from "../components/Navigation/Navigation";

var Router = () =>{
    return <BrowserRouter>
      <Routes>
        { routes.map(route => <Route
            Component={route.component}
            path={route.path}
            exact={route.exact}
            />)}
        <Route path="/" /> {/* 👈 Renders at /app/ */}
      </Routes>
      <Navigation />
    </BrowserRouter>
}


export default Router;