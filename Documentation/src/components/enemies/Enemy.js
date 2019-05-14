import React from 'react';

import EnemyStyles from './Enemy.styled';

const Enemy = ({enemy}) => {
    return <EnemyStyles>
        <div className="enemy-name">
            {enemy.name}
        </div>
        <div className="enemy-description">
            {enemy.description}
        </div>
        <div className="enemy-icon">
            <img src={enemy.image} />
        </div>
    </EnemyStyles>
};

export default Enemy;