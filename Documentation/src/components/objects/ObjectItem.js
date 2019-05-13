import React from 'react';

import ObjectItemStyles from './ObjectItem.styled';

const ObjectItem = ({objectItem}) => {
    return <ObjectItemStyles>
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

export default ObjectItem;