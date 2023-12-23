import { BrowserRouter, Routes, Route } from "react-router-dom";
import routes from "./routes";
import Navigation from "../components/Navigation/Navigation";
import ScrollToTop from "../components/ScrollToTop/ScrollToTop";

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
      <ScrollToTop />
    </BrowserRouter>
}


export default Router;