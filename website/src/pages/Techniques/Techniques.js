import PageHeader from "../../components/PageHeader/PageHeader";
import PageTitle from "../../components/PageTitle/PageTitle";
import TechniquesStyles from "./Techniques.styles";
import { blue, green, red, yellow } from "../../styles/colors";
import NesPadAction from "../../components/NesPad/NesPadAction/NesPadAction";
import NesPadCross from "../../components/NesPad/NesPadCross/NesPadCross";

import Arrow from "../../images/right-arrow.png";
import Kick1 from "./images/Kick1.png";
import Kick2 from "./images/Kick2.png";
import KickUp1 from "./images/KickUp1.png";
import KickUp2 from "./images/KickUp2.png";
import MovingKickUp1 from "./images/MovingKickUp1.png";
import MovingKickUp2 from "./images/MovingKickUp2.png";
import Drop1 from "./images/Drop1.png";
import Drop2 from "./images/Drop2.png";
import Swim1 from "./images/Swim1.png";
import Swim2 from "./images/Swim2.png";
import Sink1 from "./images/Sink1.png";
import Sink2 from "./images/Sink2.png";
import Lava1 from "./images/Lava1.png";
import Lava2 from "./images/Lava2.png";
import Fire from "./images/Fire.png";
import Fire1 from "./images/Fire1.png";
import Fire2 from "./images/Fire2.png";
import Climb1 from "./images/Climb1.png";
import Climb2 from "./images/Climb2.png";
import ClimbJump1 from "./images/ClimbJump1.png";
import ClimbJump2 from "./images/ClimbJump2.png";
import Burn1 from "./images/Burn1.png";
import Burn2 from "./images/Burn2.png";
import Ice1 from "./images/Ice1.png";
import Ice2 from "./images/Ice2.png";
import Frozen1 from "./images/Frozen1.png";
import Frozen2 from "./images/Frozen2.png";
import FrozenKick1 from "./images/FrozenKick1.png";
import FrozenKick2 from "./images/FrozenKick2.png";
import Fly1 from "./images/Fly1.png";
import Fly2 from "./images/Fly2.png";
import Bat1 from "./images/Bat1.png";
import Bat2 from "./images/Bat2.png";
import BatAttack1 from "./images/BatAttack1.png";
import BatAttack2 from "./images/BatAttack2.png";
import BatDeflect1 from "./images/BatDeflect1.png";
import BatDeflect2 from "./images/BatDeflect2.png";
import FreezeWater1 from "./images/FreezeWater1.png";
import FreezeWater2 from "./images/FreezeWater2.png";
import FireProof1 from "./images/FireProof1.png";
import FireProof2 from "./images/FireProof2.png";
import FireDash1 from "./images/FireDash1.png";
import FireDash2 from "./images/FireDash2.png";
import Frog1 from "./images/Frog1.png";
import Frog2 from "./images/Frog2.png";
import FrogInvincible1 from "./images/FrogInvincible1.png";
import FrogInvincible2 from "./images/FrogInvincible2.png";
import FrogJump1 from "./images/FrogJump1.png";
import FrogJump2 from "./images/FrogJump2.png";
import ShellSpin1 from "./images/ShellSpin1.png";
import ShellSpin2 from "./images/ShellSpin2.png";
import ShellAttack1 from "./images/ShellAttack1.png";
import ShellAttack2 from "./images/ShellAttack2.png";
import ShellBuff1 from "./images/ShellBuff1.png";
import ShellBuff2 from "./images/ShellBuff2.png";
import Hammer1 from "./images/Hammer1.png";
import Hammer2 from "./images/Hammer2.png";
import HammerStone1 from "./images/HammerStone1.png";
import HammerStone2 from "./images/HammerStone2.png";
import GroundPound1 from "./images/GroundPound1.png";
import GroundPound2 from "./images/GroundPound2.png";
import GroundPound3 from "./images/GroundPound3.png";
import GroundPound4 from "./images/GroundPound4.png";
import Shuriken1 from "./images/Shuriken1.png";
import Shuriken2 from "./images/Shuriken2.png";
import Shuriken3 from "./images/Shuriken3.png";
import Shuriken4 from "./images/Shuriken4.png";
import WallJump1 from "./images/WallJump1.png";
import WallJump2 from "./images/WallJump2.png";
import WallJump3 from "./images/WallJump3.png";
import WallJump4 from "./images/WallJump4.png";

var Techniques = () => {
  return (
    <TechniquesStyles>
      <PageTitle title="Techniques">
        Adventure 3 throws a lot of new enemies and hazards in his way.
        Thankfully, Mario has a few new techniques he can use to clear
        obstacles, defeat enemies and solve puzzles!
      </PageTitle>
      <PageHeader color={yellow}>Carrying Objects</PageHeader>
      <div className="techniques-layout">
        Mario can grab enemies and some objects by holding <NesPadAction B />{" "}
        when coming in contact with them. Objects that can be picked up include:
        <ul>
          <li>Shells</li>
          <li>Keys</li>
          <li>Frozen enemies</li>
          <li>Springs</li>
          <li>And more...</li>
        </ul>
        When Mario releases the <NesPadAction B /> button, he will kick the
        objects forward. For shells, this will send them forward in to a spin.
        Spinning shells can brick bricks and activate item blocks.
        <div className="techniques-screenshots">
          <img src={Kick1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Kick2} />
        </div>
      </div>
      <PageHeader color={red}>Advanced Kicks</PageHeader>
      <div className="techniques-layout">
        Mario can control his kicks by holding the <NesPadCross up /> in various
        directions. When Mario is standing still, holding <NesPadCross up />{" "}
        will kick the objects straight up. Shells will be kicked up without a
        spin.
        <div className="techniques-screenshots">
          <img src={KickUp1} />
          <img className="right-arrow" src={Arrow} />
          <img src={KickUp2} />
        </div>
        When Mario is moving and is holding <NesPadCross up />, he will kick the
        object up and forward in a direction relative to his movement speed. So
        moving faster results in a faster kick.
        <div className="techniques-screenshots">
          <img src={MovingKickUp1} />
          <img className="right-arrow" src={Arrow} />
          <img src={MovingKickUp2} />
        </div>
        Finally, Mario can drop an object by holding <NesPadCross down />. This
        will also drop shells without a spin.
        <div className="techniques-screenshots">
          <img src={Drop1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Drop2} />
        </div>
      </div>
      <PageHeader color={blue}>Swimming</PageHeader>
      <div className="techniques-layout">
        Mario can swim through water by repeatedly tapping the{" "}
        <NesPadAction A /> button. When Mario reachs the top of the water, he
        will simply jump out! (Note: you do NOT need to hold <NesPadCross up />{" "}
        to exit the water).
        <div className="techniques-screenshots">
          <img src={Swim1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Swim2} />
        </div>
        Some water is too bouyant for Mario to sink in. To sink in this kind of
        water, Mario needs to hold any object.
        <div className="techniques-screenshots">
          <img src={Sink1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Sink2} />
        </div>
      </div>
      <PageHeader color={green}>Climbing</PageHeader>
      <div className="techniques-layout">
        Mario can climb vines, webs and chains. To climb, hold <NesPadCross up down /> when moving over a vine, web or chain. From there,
        press and hold any direction <NesPadCross up down left right />.
        <div className="techniques-screenshots">
            <img src={Climb1} />
            <img className="right-arrow" src={Arrow} />
            <img src={Climb2} />
        </div>
        Mario can jump from a climb by tapping <NesPadAction A />. Holding <NesPadCross left right /> will move Mario during the jump.
        <div className="techniques-screenshots">
            <img src={ClimbJump1} />
            <img className="right-arrow" src={Arrow} />
            <img src={ClimbJump2} />
        </div>
      </div>
      <PageHeader color={red}>Fire Mario</PageHeader>
      <div className="techniques-layout">
        Fire Mario has the ability to throw fireballs by tapping the <NesPadAction B /> button. He can throw up to 2 fireballs at a time.
        <div className="techniques-screenshots">
          <img src={Fire} />
          <img className="right-arrow" src={Arrow} />
          <img src={Fire1} />
        </div>
        Fire Mario can also toss fireballs up in to the air by holding <NesPadAction up /> when pressing <NesPadAction B />.
        <div className="techniques-screenshots">
          <img src={Fire} />
          <img className="right-arrow" src={Arrow} />
          <img src={Fire2} />
        </div>
        Fireballs can interact with various objects such as thawing frozen coins, burning catuses and lighting candles! Note:
        enemy fireballs can also interact with these same objects, so be careful!
        <div className="techniques-screenshots">
          <img src={Burn1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Burn2} />
        </div>
      </div>
      <PageHeader color={blue}>Ice Mario</PageHeader>
      <div className="techniques-layout">
        Ice Mario can throw iceballs by tapping the <NesPadAction A /> button. Iceballs move slower and bounce higher than fireballs.
        <div className="techniques-screenshots">
          <img src={Ice1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Ice2} />
        </div>
        Ice balls can interact with various objects in the environment, including freezing the surface of water, munchers and putting out fires.
        Frozen water can be stood on, but the water Mario freezes will eventually thaw. Note: enemy iceballs can also interact with these same objects, so be careful!
        <div className="techniques-screenshots">
          <img src={FreezeWater1} />
          <img className="right-arrow" src={Arrow} />
          <img src={FreezeWater2} />
        </div>
        Mario can freeze enemies with his iceballs. Frozen enemies can be stood on, carried and kicked in to other enemies. Frozen enemies
        will shatter after a short time.
        <div className="techniques-screenshots">
          <img src={Frozen1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Frozen2} />
        </div>
        <div className="techniques-screenshots">
          <img src={FrozenKick1} />
          <img className="right-arrow" src={Arrow} />
          <img src={FrozenKick2} />
        </div>
      </div>
      <PageHeader color={red}>Raccoon Mario</PageHeader>
      <div className="techniques-layout">
        Raccoon Mario can change his P-Meter by running along the ground with <NesPadCross left right /> + <NesPadAction B />. Once charged,
        jump in to the air with <NesPadAction A /> to begin flying. Tapping <NesPadAction A /> repeatedly will gain altitude.
        <div className="techniques-screenshots">
          <img src={Fly1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Fly2} />
        </div>
        With his tail, Mario can bat it by talling the <NesPadAction B /> button. Mario can bat his tail into blocks to activate them from the side.
        <div className="techniques-screenshots">
          <img src={Bat1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Bat2} />
        </div>
        Mario's tail bat can also attack enemies!
        <div className="techniques-screenshots">
          <img src={BatAttack1} />
          <img className="right-arrow" src={Arrow} />
          <img src={BatAttack2} />
        </div>
        Mario's tail bat can also deflect projects back at enemies! A deflected projectile will hurt other enemies.
        <div className="techniques-screenshots">
          <img src={BatDeflect1} />
          <img className="right-arrow" src={Arrow} />
          <img src={BatDeflect2} />
        </div>
      </div>
      <PageHeader color="orange">Fox Mario</PageHeader>
      <div className="techniques-layout">
        Fox Mario is a fire based power that lets Mario dash forward. The fire dash can attack enemies and makes Mario
        invulnerable to projectiles. To dash, double tap <NesPadAction B /> and continue holding <NesPadAction B /> to continue
        the dash. Your P-Meter will deplete and Mario will come out of the dash once he hits a wall or runs out of P-Meter. The fire
        dash can also activate item blocks, break bricks and is the only way to break rotating blocks.
        <div className="techniques-screenshots">
          <img src={FireDash1} />
          <img className="right-arrow" src={Arrow} />
          <img src={FireDash2} />
        </div>
        Being born of fire, Fox Mario is actually invulnerable to fireball attacks!
        <div className="techniques-screenshots">
          <img src={FireProof1} />
          <img className="right-arrow" src={Arrow} />
          <img src={FireProof2} />
        </div>
        Normally, Mario is harmed by lava, but as Fox Mario, he can swim in lava like it's water!
        <div className="techniques-screenshots">
          <img src={Lava1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Lava2} />
        </div>
      </div>
      <PageHeader color={yellow}>Poison Frog Mario</PageHeader>
      <div className="techniques-layout">
        When wearing the Poison Frog Suit, Mario's swimming abilities change. He
        won't sink in water, but instead, swims by holding the{" "}
        <NesPadCross up down left right /> buttons. Holding <NesPadAction A />{" "}
        causes Mario to swim faster! In order to exit water as a Poison Frog,
        you must be holding <NesPadCross up /> + <NesPadAction A />.
        <div className="techniques-screenshots">
          <img src={Frog1} />
          <img className="right-arrow" src={Arrow} />
          <img src={Frog2} />
        </div>
        The Poison Frog Suit also comes with a few abilities. Double tapping <NesPadAction B /> and continuing to hold
        down <NesPadAction B /> will activate a burst of invincibility until his P-Meter runs out.
        <div className="techniques-screenshots">
          <img src={FrogInvincible1} />
          <img className="right-arrow" src={Arrow} />
          <img src={FrogInvincible2} />
        </div>
        Did you know frogs are really good at jumping? Well Poison Frog Mario does! Press and hold down <NesPadAction A /> to
        perform a SUPER high jump!
        <div className="techniques-screenshots">
          <img src={FrogJump1} />
          <img className="right-arrow" src={Arrow} />
          <img src={FrogJump2} />
        </div>
      </div>
      <PageHeader color={green}>Shell Mario</PageHeader>
      <div className="techniques-layout">
        Shell Mario can spin in to a shell by getting enough movement speed and holding <NesPadCross down /> to go in to
        a spin. While spinning, Mario can access smaller areas, activate item blocks and break bricks!
        <div className="techniques-screenshots">
            <img src={ShellSpin1} />
            <img className="right-arrow" src={Arrow} />
            <img src={ShellSpin2} />
        </div>
        Shell Mario's spin also works as an attack. Any thing a Koopa shell spin can hurt, Mario's shell spin can hurt!
        <div className="techniques-screenshots">
            <img src={ShellAttack1} />
            <img className="right-arrow" src={Arrow} />
            <img src={ShellAttack2} />
        </div>
        Mario's shell can be pretty durable while spinning. Mario's shell spin allows him to buff off harmful obstacles from below.
        He won't come out of a spin while buffing until landing on safe terrain.
        <div className="techniques-screenshots">
            <img src={ShellBuff1} />
            <img className="right-arrow" src={Arrow} />
            <img src={ShellBuff2} />
        </div>
      </div>
      <PageHeader color="black">Sledge Mario</PageHeader>
      <div className="techniques-layout">
        Sledge Mario throws sledge hammers that are quite a bit more powerful than normal hammers. Sledge hammers can activate item blocks,
        break bricks and stone blocks. To throw a sledge hammer, simply tap <NesPadAction B />. Note: enemy sledge hammers can interact with the same
        objects, so be careful!
        <div className="techniques-screenshots">
            <img src={Hammer1} />
            <img className="right-arrow" src={Arrow} />
            <img src={Hammer2} />
        </div>
        <div className="techniques-screenshots">
            <img src={HammerStone1} />
            <img className="right-arrow" src={Arrow} />
            <img src={HammerStone2} />
        </div>
        Seldge Mario can also perform a ground pound maneuver. While in the air, holding down <NesPadCross down /> and pressing <NesPadAction B /> will
        send Mario flipping downard in his protective shell. This attack can hurt any enemy that is vulnerable to Mario's Sledge hammers. This attack
        can even activate item blocks and break brick blocks.
        <div className="techniques-screenshots">
            <img src={GroundPound1} />
            <img className="right-arrow" src={Arrow} />
            <img src={GroundPound2} />
        </div>
        <div className="techniques-screenshots">
            <img src={GroundPound3} />
            <img className="right-arrow" src={Arrow} />
            <img src={GroundPound4} />
        </div>
      </div>
      <PageHeader color="black">Ninja Mario</PageHeader>
        <div className="techniques-layout">
            Ninja Mario is very nimble. He can throw shurikens with the <NesPadAction B /> button. However, by holding any direction on
            <NesPadCross />, he can throw shurikens in 7 directions:
            <ul>
                <li><NesPadCross /> + <NesPadAction B /> (nothing held) throws shurikens in direction facing</li>
                <li><NesPadCross left /> + <NesPadAction B /> throws shurikens left</li>
                <li><NesPadCross right /> + <NesPadAction B /> throws shurikens right  </li>
                <li><NesPadCross up /> + <NesPadAction B /> throws shurikens up</li>
                <li><NesPadCross up right /> + <NesPadAction B /> throws shurikens up + right diagonally</li>
                <li><NesPadCross up left /> + <NesPadAction B /> throws shurikens up + left diagonally</li>
                <li><NesPadCross down /> + <NesPadAction B /> throw shurikens down diagonally in the direction Mario is facing</li>
                <li><NesPadCross down left/> + <NesPadAction B /> throws shurikens down + left diagonally</li>
                <li><NesPadCross down right/> + <NesPadAction B /> throws shurikens down + right diagonally</li>
            </ul>
            <div className="techniques-screenshots">
                <img src={Shuriken1} />
                <img className="right-arrow" src={Arrow} />
                <img src={Shuriken2} />
            </div>
            <div className="techniques-screenshots">
                <img src={Shuriken3} />
                <img className="right-arrow" src={Arrow} />
                <img src={Shuriken4} />
            </div>
            Ninja Mario can also perform a wall jump. While in the air, holding <NesPadCross right /> while against a wall to the right or Mario
            holding <NesPadCross left /> while against a wall to the left of Mario will cause Mario to slide down the wall slowly. While in this slide
            tapping <NesPadAction A /> will cause Mario to jump up and away from the wall. Chain these to scale tall structures!
            <div className="techniques-screenshots">
                <img src={WallJump1} />
                <img className="right-arrow" src={Arrow} />
                <img src={WallJump2} />
            </div>
            <div className="techniques-screenshots">
                <img src={WallJump3} />
                <img className="right-arrow" src={Arrow} />
                <img src={WallJump4} />
            </div>
        </div>
    </TechniquesStyles>
  );
};

export default Techniques;
