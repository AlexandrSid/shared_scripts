#Requires AutoHotkey v2.0
;Download authotkey2 from https://www.autohotkey.com/download/ahk-v2.exe
;Script to buy Lambo Revuelto and open it's SkillPoints
;to unlock WHEELSPINs and SUPERWHEELSPINs
;in Forza Horizon 6
;
;Start position - Garage Menu - Buy&Sell - Autoshow
;move and hold mosue cursor in the up-left corner of the screen 

;One cycle iteration requires 39 avaliable SkillPoints
;and takes approximatley 50 seconds
;
;CarsToBuy - change this number in script, than save it and refresh in AutoHotKey context menu in your computer's tray
;Default value is 1, maximum amount is 25 (999 max stored SkillPoints / 39 SkillPoints per car = 25 cars + 24 SkillPoints left)
;
;To start the script press F8
;After script running it couldn't be stopted, but you can collapse the game window and stop it manualy in system tray by pressing Pause or Refresh
;or you can add hotkeys for this behaviour of AutoHotKey yourself

CarsToBuy := 1
running := false
ByingSceneLength := 20000 ;20 seconds to finish car purchase and show car opening scene, it could be reduced if there is too long after "new car open scene" finsh

F8::
{
    global CarsToBuy, ByingSceneLength, running

    if running
        return

    running := true

    Loop CarsToBuy
    {
		NavigateMainMenuToLamboRevuelto()
		PurchaseCar()
		NavigateToCarMastery()
		OpenRevueltoCarMastery()
		NavigateFromCarMasteryBackToMainMenu()
			
    }

    running := false
}

;--------------------
;functions
;--------------------


NavigateMainMenuToLamboRevuelto()
{		
		NoiseSleep 150
        Send "{Enter}"
		NoiseSleep 2000
        Send "{BS}"	
		NoiseSleep 150
		;9 times DOWN and one RIGHT to choose Lamboghini
		Loop 9
		{
			NoiseSleep 300
            Send "{Down}"			
		}
		NoiseSleep 300
		Send "{Right}"
		
		NoiseSleep 300
        Send "{Enter}"		
		NoiseSleep 150
}

PurchaseCar()
{
		global ByingSceneLength
		
		NoiseSleep 450
        Send "{Enter}"
		NoiseSleep 7000
        Send "{Enter}"
		NoiseSleep 800
        Send "{Enter}"
		NoiseSleep 800
        Send "{Enter}"
		NoiseSleep 800
        Send "{Enter}"		
		NoiseSleep ByingSceneLength
		
        Send "{Esc}"		
        NoiseSleep 1500		
}

NavigateToCarMastery()
{
		NoiseSleep 150
		Send "{Right}"
		NoiseSleep 300
		Send "{Down}"
		NoiseSleep 300
		Send "{Enter}"
		NoiseSleep 400
		Loop 7
		{
		NoiseSleep 300
		Send "{Down}"
		}
		NoiseSleep 300
		Send "{Enter}"
		NoiseSleep 150

}

OpenRevueltoCarMastery()
{
		ArrowDelay := 330
		AnimationDelay := 870

		NoiseSleep 700
		Send "{Enter}"
		NoiseSleep 1600
		Send "{Up}"
		NoiseSleep ArrowDelay
		Send "{Enter}"
		NoiseSleep AnimationDelay
		Send "{Up}"
		NoiseSleep ArrowDelay
		Send "{Enter}"
		NoiseSleep AnimationDelay
		Send "{Up}"
		NoiseSleep ArrowDelay
		Send "{Enter}"
		NoiseSleep AnimationDelay
		Send "{Right}"
		NoiseSleep ArrowDelay
		Send "{Enter}"
		NoiseSleep AnimationDelay
		Send "{Right}"
		NoiseSleep ArrowDelay
		Send "{Enter}"
		
		NoiseSleep 600

}

NavigateFromCarMasteryBackToMainMenu()
{
		
	NoiseSleep 150
		Send "{Esc}"		
			NoiseSleep 1500	
		Send "{Esc}"		
			NoiseSleep 2000
		Send "{Up}"		
			NoiseSleep 900
		Send "{Left}"		
			NoiseSleep 300
		;Send "{Up}"		
    NoiseSleep 150

}

NoiseSleep(millis)
{
    noiseLimit := millis < 1000
        ? Round(millis * 0.1)
        : 100

    Sleep millis + Random(0, noiseLimit)
}