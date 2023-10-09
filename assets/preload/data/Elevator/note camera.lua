function onCreate()
buffheight = 470
xx = 600;
yy = buffheight;
xx2 = 830;
yy2 = buffheight;
xx3 = 300;
yy3 = defaultGirlfriendY + 100;
ofs = 60;
ofs2 = 120;
followchars = false;
del = 0;
del2 = 0;
customcamera = false;
defaultZoomthis = 1;
toggletilt = 'left';
istilting = false;
zoomallowed = true;

end


function onStepHit()

    if curStep == 44 then
        
        --setProperty('defaultCamZoom', 0.9);
    end
    if curStep == 182 then
        --setProperty('defaultCamZoom', 1);
    end
    if curStep == 186 then
        --setProperty('defaultCamZoom', 1.2);
    end

    if curStep == 190 then
        --setProperty('defaultCamZoom', 0.7);
    end


end

function punchZoom(amount, duration)
    if cameraZoomOnBeat then
    doTweenZoom('beginpunch', 'camGame', amount, 0.001, 'linear');
    doTweenZoom('easeOutpunch', 'camGame', 1, duration, 'quintOut');
    end
end

function tiltBoom(amount, duration)
    if cameraZoomOnBeat then
    doTweenAngle('begintilt', 'camGame', amount, 0.001, 'linear')
    doTweenAngle('easeOuttilt', 'camGame', 0, duration, 'quintOut')
    end
end

function tiltZoom(tiltamount,zoomamount, duration)
    if cameraZoomOnBeat then
    doTweenAngle('begintilt', 'camGame', tiltamount, 0.001, 'linear');
    doTweenAngle('easeOuttilt', 'camGame', 0, duration, 'quintOut');
    doTweenZoom('beginpunch', 'camGame', zoomamount, 0.001, 'linear');
    doTweenZoom('easeOutpunch', 'camGame', 1, duration, 'quintOut');
    end
end

function tiltyBeat()

    if cameraZoomOnBeat then

        if toggletilt == 'left' then
            toggletilt = 'right';
            tiltZoom(4,0.85,0.9);
        elseif toggletilt == 'right' then
            toggletilt = 'left';
            tiltZoom(-4,0.85,0.9);
        end

    end

end

function tiltyNZBeat()

    if cameraZoomOnBeat then

        if toggletilt == 'left' then
            toggletilt = 'right';
            tiltBoom(5,0.9);
        elseif toggletilt == 'right' then
            toggletilt = 'left';
            tiltBoom(-5,0.9);
        end

    end

end

function pulseSnare()

        if cameraZoomOnBeat then

        if toggletilt == 'left' then
            toggletilt = 'right';
            punchZoom(1.05, 0.9);
        elseif toggletilt == 'right' then
            toggletilt = 'left';
            --punchZoom(1.1, 0.9);
        end

    end
    
end

function onBeatHit()

    

    

    --"OKAY KID"

    if curBeat % 1 == 0 then
        if istilting == true then    
            if zoomallowed == true then
            tiltyBeat();
            else
            tiltyNZBeat();
            end
        elseif isbopping == true then
            pulseSnare();
        end
    
    end

    if curBeat == 4 then
        --punchZoom(2,4);
        --tiltZoom(10,0.8,0.7);
    end

    if curBeat == 44 then
        isbopping = true;
    end

    if curBeat == 60 then
        followchars = true;
        --doTweenZoom('begin', 'camGame', 0.7, 1, 'quintOut');
        --followchars = false;
        --triggerEvent('Camera Follow Pos',1030,450)
        --setProperty('defaultCamZoom',  0.6);
    end

    if curBeat == 72 then
        isbopping = false;
    end

    if curBeat == 76 then
        isbopping = true;
    end

    if curBeat == 90 then
        isbopping = false;
    end

    if curBeat == 92 then
        isbopping = true;
    end

    if curBeat == 104 then
        isbopping = false;
    end

    if curBeat == 108 then
        isbopping = true;
    end

    if curBeat == 136 then
        isbopping = false;
    end

    if curBeat == 139 then
        istilting = true;
    end

    if curBeat == 172 then
        followchars = false;
        --zoomallowed = false;
        
    end

    if curBeat == 203 then
        istilting = false;
    end

end


function onUpdate()





    
    -- PINKIE ALTS
    --if curBeat >= 248 and curBeat <= 311 then
        
    --end

    if mustHitSection == true then
        --FOCUSED ON BF
        --setProperty('defaultCamZoom', 0.9);
    else

        --FOCUSED ON SPINEL
        if customcamera == false then
        --setProperty('defaultCamZoom', 0.95);
        end
    end



    --CAMERA FOLLOW Updates    
    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then

            --DAD
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
                --setProperty('defaultCamZoom', 0.8);
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
                --setProperty('defaultCamZoom', 0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
                --setProperty('defaultCamZoom', 0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
                --setProperty('defaultCamZoom', 0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
                --setProperty('defaultCamZoom', 0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end


        if gfSection == true then
            --GIRLFRIEND
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end

            if getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end
        end

        else
            --BOYFRIEND
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end

            if gfSection == true then
                --GIRLFRIEND
                triggerEvent('Camera Follow Pos','','')
            end

        end
    else
        if followchars == false then
        
            triggerEvent('Camera Follow Pos','720','470')
        
        end
    end

    if followchars == false then
        
        triggerEvent('Camera Follow Pos','720','470')
    
    end
    
end