import React from 'react';

import EnemyStyles from './Enemy.styled';

const Enemy = ({enemy}) => {
    return <EnemyStyles>
        <div className="enemy-name">
            {enemy.name}
        </div>
        <div className="enemy-icon">
            <img src={enemy.image} />
        </div>
        <div className="enemy-mario">
            <img src={enemy.example} />
        </div>
        <div className="enemy-description">
            {enemy.description}
        </div>
        
    </EnemyStyles>
};

export default Enemy;