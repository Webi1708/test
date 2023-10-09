
adjustmenty = 30;

function onCreate()
	-- background shit
	makeLuaSprite('BG', 'ElevatorBG', -190, 0);
	setScrollFactor('BG', 0.95, 0.95);
	scaleObject('BG', 1, 1);

	makeLuaSprite('BGC', 'ElevatorBGChristmas', -190, 0);
	setScrollFactor('BGC', 0.95, 0.95);
	scaleObject('BGC', 1, 1);
	setProperty('BGC.alpha', 0);

	makeLuaSprite('BG2', 'ElevatorBG2', -300, -90 - adjustmenty);
	setScrollFactor('BG2', 0.95, 0.95);
	scaleObject('BG2', 1, 1);
	setProperty('BG2.alpha', 0);

	makeAnimatedLuaSprite('BG3', 'ElevatorBGSpecial', -259, -192);
	addAnimationByPrefix('BG3', 'white', 'ElevatorBG3', 24, false);
	addAnimationByPrefix('BG3', 'black', 'ElevatorBG4', 24, false);
	objectPlayAnimation('BG3', 'white');
	setProperty('BG3.alpha', 0);
	setBlendMode('BG3', 'OVERLAY');
	

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

	makeAnimatedLuaSprite('shadow', 'shadow', 30, 90);
	addAnimationByPrefix('shadow', 'static', 'ElevatorShadow/Static', 24, true);
	addAnimationByPrefix('shadow', 'open', 'ElevatorShadow/Open', 24, false);
	addAnimationByPrefix('shadow', 'boys', 'ElevatorShadow/Boys', 24, false);
	objectPlayAnimation('shadow', 'static');
	setScrollFactor('shadow', 1, 1);
	scaleObject('shadow', 2, 2);
	setProperty('shadow.alpha', 0);
	setObjectOrder('shadow',20);
	setBlendMode('shadow','OVERLAY');

	makeAnimatedLuaSprite('shadow2', 'shadow2', 30, 130 - adjustmenty);
	addAnimationByPrefix('shadow2', 'static', 'TheEndingShadows0001', 24, true);
	addAnimationByPrefix('shadow2', 'close', 'TheEndingShadows', 24, false);
	objectPlayAnimation('shadow2', 'static');
	setScrollFactor('shadow2', 1, 1);
	scaleObject('shadow2', 2, 2);
	setProperty('shadow2.alpha', 0);
	setObjectOrder('shadow2',21);
	setBlendMode('shadow2','OVERLAY');

	end

	addLuaSprite('BG', false);
	addLuaSprite('BGC', false);
	addLuaSprite('BG2', false);
	addLuaSprite('BG3', false);
	addLuaSprite('shadow', false);
	addLuaSprite('shadow2', false);


	--setObjectOrder('booth',20);

	
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end