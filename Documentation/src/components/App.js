import React from 'react';

import PowerUp from './powerups/PowerUp';
import PowerUpList from './powerups/PowerUpList';

import ObjectItem from './objects/ObjectItem';
import ObjectList from './objects/ObjectList';

import Enemy from './enemies/Enemy';
import EnemyList from './enemies/EnemyList';

import reset from '../styles/reset.css';

class App extends React.Component {
    constructor(props){
        super(props);

    }

    render() {
        return <div>
            <div style={{display: 'flex', margin: "auto", flexWrap: "wrap", width: "918px"}}>
                {EnemyList.map(e => {
                    return <Enemy enemy={e} />
                })}

                {ObjectList.map(o => {
                    return <ObjectItem objectItem={o} />
                })}

                {PowerUpList.map(p => {
                    return <PowerUp powerUp={p} />
                })}
            </div>
            
        </div>;
    }
}

export default App;