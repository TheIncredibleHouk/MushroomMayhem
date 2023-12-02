import React from 'react';

import PowerUpStyles from './PowerUp.styled';

const PowerUp = ({powerUp}) => {
    return <PowerUpStyles>
        <div className="powerup-icon">
            <img src={powerUp.image} />
        </div>
        <div className="powerup-name">
            {powerUp.name}
        </div>
        <div className="powerup-description">
            {powerUp.description}
        </div>
        <div className="powerup-mario">
            <img src={powerUp.example} />
        </div>
    </PowerUpStyles>
};

export default PowerUp;