extends CanvasLayer

var coins = 0

	
func handleCoinCollected():
	coins += 10
	$CoinsCollected.text = ": " + str(coins)
	
	if coins == 30:
		call_deferred("change_lvl")
		#GLOBAL.next_lvl()
		
func change_lvl():
	GLOBAL.next_lvl()

