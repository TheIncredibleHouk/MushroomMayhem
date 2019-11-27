import React from 'react';

import MoveStyles from './Move.styled';

const Move = ({move}) => {
    return <MoveStyles>
        <div className="object-name">
            {objectItem.name}
        </div>
        <div className="object-icon">
            <img src={objectItem.image} />
        </div>
        <div className="object-mario">
            <img src={objectItem.example} />
        </div>
        <div className="object-description">
            {objectItem.description}
        </div>
        
    </ObjectItemStyles>
};

export default Move;