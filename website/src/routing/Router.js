import { BrowserRouter, Routes, Route } from "react-router-dom";
import routes from "./routes";

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
    </BrowserRouter>
}


export default Router;