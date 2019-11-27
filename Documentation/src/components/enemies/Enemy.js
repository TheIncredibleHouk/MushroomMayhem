import React from 'react';

import EnemyStyles from './Enemy.styled';
import fireball from './images/fireball.png';
import iceball from './images/iceball.png';
import hammer from './images/hammer.png';
import shuriken from './images/shuriken.png';
import tail from './images/tail.png';
import dash from './images/dash.png';
import shell from './images/shell.png';
import stomp from './images/stomp.png';
import nodeath from './images/nodeath.png';
import wind from './images/wind.png';

var healthArray = [0, 1, 2, 3, 4];

const Enemy = ({enemy}) => {
    return <EnemyStyles>
        <div className="enemy-name">
            {enemy.name}
        </div>
        <div className="enemy-info">
            <div className="enemy-description">
                {enemy.description}
            </div>
            <div className="enemy-icon">
                <img src={enemy.image} />
            </div>
        </div>
        <div className="enemy-health">
            <div className="health-stats">
                <span className="fire-health" title={enemy.fireballs ? `Takes ${enemy.fireballs} fireballs to defeat.` : 'Fireball proof'}>
                {
                    healthArray.map((h, index) => {
                        return <img src={fireball} className={enemy.fireballs > index ? '' : 'grey'} />
                    })
                }
                </span>
                <span className="ice-health" title={enemy.iceballs ? `Takes ${enemy.iceballs} iceballs to defeat.` : 'Iceball proof'}>
                {
                    healthArray.map((h, index) => {
                        return <img src={iceball} className={enemy.iceballs > index ? '' : 'grey'} />
                    })
                }
                </span>
            
                <span className="hammer-health" title={enemy.hammers ? `Takes ${enemy.hammers} hammers to defeat.` : 'Hammer proof'}>{
                    healthArray.map((h, index) => {
                        return <img src={hammer} className={enemy.hammers > index ? '' : 'grey'} />
                    })
                }
                </span>
                <span className="shuriken-health" title={enemy.shurikens ? `Takes ${enemy.shurikens} shurikens to defeat.` : 'Shuriken proof'}>{
                    healthArray.map((h, index) => {
                        return <img src={shuriken} className={enemy.shurikens > index ? '' : 'grey'} />
                    })
                }
                </span>
            </div>
            <div className="stats">
                { enemy.nodeath ?
                    <span title="Invincible" className="no-death"><img src={nodeath} /></span> : null }
                { enemy.stomp ?
                    <span title="Defeated when stomped on" className="stomp-health"><img src={stomp} /></span> : null }
                { enemy.tail ?
                    <span title="Defeated with tail whack" className="tail-health"><img src={tail} /></span> : null }
                { enemy.shell ?
                    <span title="Defeated when a shell hits" className="shell-health"><img src={shell} /> </span> : null }
                { enemy.dash ?
                    <span title="Defeated by Fire Fox dash attack" className="dash-health"><img src={dash} /></span> : null }
                { enemy.wind ?
                    <span title="Wind affects" className="wind-affects"><img src={wind} /></span> : null }
            </div>
        </div>
    </EnemyStyles>
};

export default Enemy;