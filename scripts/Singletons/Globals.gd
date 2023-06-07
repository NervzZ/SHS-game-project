extends Node

const gameItems := {
	"Cyber Shield Keycard": {
		"image": preload("res://graphics/items/keycard.png"),
		"description": "This is my badge. I will need it to access the Cyber Shield office as the entrance door can only unlock with it to prevent unauthorized access."
	},
	# Add more items here if needed
}

const objectives := {
	"Go to work": {
		"description": "I need to go to work. If I'm late again my boss is going to kill me.",
		"nextObjective": "Enter Cyber Shield"
	},
	
	"Enter Cyber Shield": {
		"description": "Alright, time to enter in the office and get to work",
		"nextObjective": null #entrer ici le nom de l'objectif suivant
	}
}
